use crate::codec::sse::Dart2RustMessageSse;
use crate::codec::BaseCodec;
use crate::codec::Rust2DartMessageTrait;
use crate::dart_fn::handler::DartFnHandler;
use crate::dart_fn::DartFnFuture;
use crate::handler::error::Error;
use crate::handler::error_listener::ErrorListener;
use crate::handler::executor::Executor;
use crate::handler::handler::{Handler, TaskContext, TaskInfo, TaskRetFutTrait};
use crate::handler::implementation::error_listener::{
    handle_non_sync_panic_error, NoOpErrorListener,
};
use crate::handler::implementation::executor::SimpleExecutor;
use crate::platform_types::DartAbi;
use crate::rust_async::SimpleAsyncRuntime;
use crate::thread_pool::BaseThreadPool;
use crate::DartOpaque;
use std::future::Future;
use std::panic;
use std::panic::UnwindSafe;

/// The default handler used by the generated code.
pub type DefaultHandler<TP> =
    SimpleHandler<SimpleExecutor<NoOpErrorListener, TP, SimpleAsyncRuntime>, NoOpErrorListener>;

impl<TP: BaseThreadPool> DefaultHandler<TP> {
    pub fn new_simple(thread_pool: TP) -> Self {
        Self::new(
            SimpleExecutor::new(NoOpErrorListener, thread_pool, Default::default()),
            NoOpErrorListener,
        )
    }

    pub fn thread_pool(&self) -> &TP {
        self.executor.thread_pool()
    }
}

/// The simple handler uses a simple thread pool to execute tasks.
pub struct SimpleHandler<E: Executor, EL: ErrorListener> {
    executor: E,
    error_listener: EL,
    dart_fn_handler: DartFnHandler,
}

impl<E: Executor, H: ErrorListener> SimpleHandler<E, H> {
    /// Create a new default handler.
    pub fn new(executor: E, error_listener: H) -> Self {
        SimpleHandler {
            executor,
            error_listener,
            dart_fn_handler: DartFnHandler::new(),
        }
    }
}

impl<E: Executor, EL: ErrorListener> Handler for SimpleHandler<E, EL> {
    fn wrap_normal<Rust2DartCodec, PrepareFn, TaskFn>(
        &self,
        task_info: TaskInfo,
        prepare: PrepareFn,
    ) where
        PrepareFn: FnOnce() -> TaskFn + UnwindSafe,
        TaskFn: FnOnce(
                TaskContext<Rust2DartCodec>,
            ) -> Result<Rust2DartCodec::Message, Rust2DartCodec::Message>
            + Send
            + UnwindSafe
            + 'static,
        Rust2DartCodec: BaseCodec,
    {
        self.wrap_normal_or_async::<Rust2DartCodec, _, _, _, _>(
            task_info,
            prepare,
            |task_info, task| {
                self.executor
                    .execute_normal::<Rust2DartCodec, _>(task_info, task)
            },
        )
    }

    fn wrap_sync<Rust2DartCodec, SyncTaskFn>(
        &self,
        task_info: TaskInfo,
        sync_task: SyncTaskFn,
    ) -> <Rust2DartCodec::Message as Rust2DartMessageTrait>::WireSyncRust2DartType
    where
        SyncTaskFn:
            FnOnce() -> Result<Rust2DartCodec::Message, Rust2DartCodec::Message> + UnwindSafe,
        Rust2DartCodec: BaseCodec,
    {
        // NOTE This extra [catch_unwind] **SHOULD** be put outside **ALL** code!
        // For reason, see comments in [wrap]
        panic::catch_unwind(move || {
            let catch_unwind_result = panic::catch_unwind(move || {
                (self.executor).execute_sync::<Rust2DartCodec, _>(task_info, sync_task)
            });
            catch_unwind_result
                .unwrap_or_else(|error| {
                    let message = Rust2DartCodec::encode_panic(&error);
                    self.error_listener.on_error(Error::Panic(error));
                    message
                })
                .into_raw_wire_sync()
        })
        // Deliberately construct simplest possible WireSyncRust2Dart object
        // instead of more realistic things like `WireSyncRust2DartSrc::new(Panic, ...)`.
        // See comments in [wrap] for why.
        .unwrap_or_else(|_| Rust2DartCodec::Message::simplest().into_raw_wire_sync())
    }

    #[cfg(feature = "rust-async")]
    fn wrap_async<Rust2DartCodec, PrepareFn, TaskFn, TaskRetFut>(
        &self,
        task_info: TaskInfo,
        prepare: PrepareFn,
    ) where
        PrepareFn: FnOnce() -> TaskFn + UnwindSafe,
        TaskFn: FnOnce(TaskContext<Rust2DartCodec>) -> TaskRetFut + Send + UnwindSafe + 'static,
        TaskRetFut: Future<Output = Result<Rust2DartCodec::Message, Rust2DartCodec::Message>>
            + TaskRetFutTrait
            + UnwindSafe,
        Rust2DartCodec: BaseCodec,
    {
        self.wrap_normal_or_async::<Rust2DartCodec, _, _, _, _>(
            task_info,
            prepare,
            |task_info, task| {
                self.executor
                    .execute_async::<Rust2DartCodec, _, _>(task_info, task)
            },
        )
    }

    fn dart_fn_invoke(
        &self,
        dart_fn: DartOpaque,
        args: Vec<DartAbi>,
    ) -> DartFnFuture<Dart2RustMessageSse> {
        self.dart_fn_handler.invoke(dart_fn, args)
    }

    fn dart_fn_handle_output(&self, call_id: i32, message: Dart2RustMessageSse) {
        self.dart_fn_handler.handle_output(call_id, message)
    }
}

impl<E: Executor, EL: ErrorListener> SimpleHandler<E, EL> {
    fn wrap_normal_or_async<Rust2DartCodec, PrepareFn, TaskFn, TaskFnRet, ExecuteFn>(
        &self,
        task_info: TaskInfo,
        prepare: PrepareFn,
        execute: ExecuteFn,
    ) where
        PrepareFn: FnOnce() -> TaskFn + UnwindSafe,
        TaskFn: FnOnce(TaskContext<Rust2DartCodec>) -> TaskFnRet,
        ExecuteFn: FnOnce(TaskInfo, TaskFn) + UnwindSafe,
        Rust2DartCodec: BaseCodec,
    {
        // NOTE This extra [catch_unwind] **SHOULD** be put outside **ALL** code!
        // Why do this: As nomicon says, unwind across languages is undefined behavior (UB).
        // Therefore, we should wrap a [catch_unwind] outside of *each and every* line of code
        // that can cause panic. Otherwise we may touch UB.
        // Why do not report error or something like that if this outer [catch_unwind] really
        // catches something: Because if we report error, that line of code itself can cause panic
        // as well. Then that new panic will go across language boundary and cause UB.
        // ref https://doc.rust-lang.org/nomicon/unwinding.html
        let _ = panic::catch_unwind(move || {
            let task_info2 = task_info.clone();
            if let Err(error) = panic::catch_unwind(move || {
                let task = prepare();
                execute(task_info2, task);
            }) {
                handle_non_sync_panic_error::<Rust2DartCodec>(
                    self.error_listener,
                    task_info.port.unwrap(),
                    error,
                );
            }
        });
    }
}
