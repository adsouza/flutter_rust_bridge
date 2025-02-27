// NOTE: This file is mimicking how a human developer writes tests,
// and is auto-generated from `method.rs` by frb_internal
// Please do not modify manually, but modify the origin and re-run frb_internal generator

use crate::frb_generated::StreamSink;
use crate::frb_generated::FLUTTER_RUST_BRIDGE_HANDLER;
use flutter_rust_bridge::for_generated::BaseThreadPool;
use flutter_rust_bridge::transfer;

#[derive(Debug, Clone)]
pub struct Log2TwinSse {
    pub key: u32,
    pub value: String,
}

pub struct ConcatenateWithTwinSse {
    pub a: String,
}

impl ConcatenateWithTwinSse {
    #[flutter_rust_bridge::frb(serialize)]
    pub fn new_twin_sse(a: String) -> ConcatenateWithTwinSse {
        ConcatenateWithTwinSse { a }
    }

    #[flutter_rust_bridge::frb(serialize)]
    pub fn concatenate_twin_sse(&self, b: String) -> String {
        format!("{}{b}", self.a)
    }

    #[flutter_rust_bridge::frb(serialize)]
    pub fn concatenate_static_twin_sse(a: String, b: String) -> String {
        format!("{a}{b}")
    }

    #[flutter_rust_bridge::frb(serialize)]
    pub fn handle_some_stream_sink_twin_sse(
        &self,
        key: u32,
        max: u32,
        sink: StreamSink<Log2TwinSse, flutter_rust_bridge::SseCodec>,
    ) {
        let a = self.a.clone();
        (FLUTTER_RUST_BRIDGE_HANDLER.thread_pool()).execute(transfer!(|| {
            for i in 0..max {
                sink.add(Log2TwinSse {
                    key,
                    value: format!("{a}{i}"),
                });
            }
            sink.close();
        }));
    }

    #[flutter_rust_bridge::frb(serialize)]
    pub fn handle_some_stream_sink_at_1_twin_sse(
        &self,
        sink: StreamSink<u32, flutter_rust_bridge::SseCodec>,
    ) {
        (FLUTTER_RUST_BRIDGE_HANDLER.thread_pool()).execute(transfer!(|| {
            for i in 0..5 {
                sink.add(i);
            }
            sink.close();
        }));
    }

    #[flutter_rust_bridge::frb(serialize)]
    pub fn handle_some_static_stream_sink_twin_sse(
        key: u32,
        max: u32,
        sink: StreamSink<Log2TwinSse, flutter_rust_bridge::SseCodec>,
    ) {
        (FLUTTER_RUST_BRIDGE_HANDLER.thread_pool()).execute(transfer!(|| {
            for i in 0..max {
                sink.add(Log2TwinSse {
                    key,
                    value: i.to_string(),
                });
            }
            sink.close();
        }));
    }

    #[flutter_rust_bridge::frb(serialize)]
    pub fn handle_some_static_stream_sink_single_arg_twin_sse(
        sink: StreamSink<u32, flutter_rust_bridge::SseCodec>,
    ) {
        (FLUTTER_RUST_BRIDGE_HANDLER.thread_pool()).execute(transfer!(|| {
            for i in 0..5 {
                sink.add(i);
            }
            sink.close();
        }));
    }
}

pub struct SumWithTwinSse {
    pub x: u32,
}

impl SumWithTwinSse {
    #[flutter_rust_bridge::frb(serialize)]
    pub fn sum_twin_sse(&self, y: u32, z: u32) -> u32 {
        self.x + y + z
    }
}

#[flutter_rust_bridge::frb(serialize)]
pub fn get_sum_struct_twin_sse() -> SumWithTwinSse {
    SumWithTwinSse { x: 21 }
}

#[flutter_rust_bridge::frb(serialize)]
pub fn get_sum_array_twin_sse(a: u32, b: u32, c: u32) -> [SumWithTwinSse; 3] {
    [
        SumWithTwinSse { x: a },
        SumWithTwinSse { x: b },
        SumWithTwinSse { x: c },
    ]
}
