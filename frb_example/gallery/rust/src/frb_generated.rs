// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.4.

#![allow(
    non_camel_case_types,
    unused,
    non_snake_case,
    clippy::needless_return,
    clippy::redundant_closure_call,
    clippy::redundant_closure,
    clippy::useless_conversion,
    clippy::unit_arg,
    clippy::unused_unit,
    clippy::double_parens,
    clippy::let_and_return,
    clippy::too_many_arguments
)]

// Section: imports

use crate::api::polars::*;
use flutter_rust_bridge::for_generated::byteorder::{NativeEndian, ReadBytesExt, WriteBytesExt};
use flutter_rust_bridge::for_generated::transform_result_dco;
use flutter_rust_bridge::{Handler, IntoIntoDart};

// Section: boilerplate

flutter_rust_bridge::frb_generated_boilerplate!();

// Section: executor

flutter_rust_bridge::frb_generated_default_handler!();

// Section: wire_funcs

fn wire_draw_mandelbrot_impl(
    port_: flutter_rust_bridge::for_generated::MessagePort,
    image_size: impl CstDecode<crate::api::mandelbrot::Size> + core::panic::UnwindSafe,
    zoom_point: impl CstDecode<crate::api::mandelbrot::Point> + core::panic::UnwindSafe,
    scale: impl CstDecode<f64> + core::panic::UnwindSafe,
    num_threads: impl CstDecode<i32> + core::panic::UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_async::<flutter_rust_bridge::for_generated::DcoCodec, _, _, _>(
        flutter_rust_bridge::for_generated::TaskInfo {
            debug_name: "draw_mandelbrot",
            port: Some(port_),
            mode: flutter_rust_bridge::for_generated::FfiCallMode::Normal,
        },
        move || {
            let api_image_size = image_size.cst_decode();
            let api_zoom_point = zoom_point.cst_decode();
            let api_scale = scale.cst_decode();
            let api_num_threads = num_threads.cst_decode();
            move |context| async move {
                transform_result_dco(
                    (move || async move {
                        crate::api::mandelbrot::draw_mandelbrot(
                            api_image_size,
                            api_zoom_point,
                            api_scale,
                            api_num_threads,
                        )
                        .await
                    })()
                    .await,
                )
            }
        },
    )
}
fn wire_DataFrame_get_column_impl(
    port_: flutter_rust_bridge::for_generated::MessagePort,
    that: impl CstDecode<flutter_rust_bridge::RustOpaque<std::sync::RwLock<DataFrame>>>
        + core::panic::UnwindSafe,
    name: impl CstDecode<String> + core::panic::UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_normal::<flutter_rust_bridge::for_generated::DcoCodec, _, _>(
        flutter_rust_bridge::for_generated::TaskInfo {
            debug_name: "DataFrame_get_column",
            port: Some(port_),
            mode: flutter_rust_bridge::for_generated::FfiCallMode::Normal,
        },
        move || {
            let api_that = that.cst_decode();
            let api_name = name.cst_decode();
            move |context| {
                transform_result_dco((move || {
                    let api_that = api_that.rust_auto_opaque_decode_ref()?;
                    crate::api::polars::DataFrame::get_column(&api_that, api_name)
                })())
            }
        },
    )
}
fn wire_DataFrame_get_column_names_impl(
    that: impl CstDecode<flutter_rust_bridge::RustOpaque<std::sync::RwLock<DataFrame>>>
        + core::panic::UnwindSafe,
) -> flutter_rust_bridge::for_generated::WireSyncRust2DartDco {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_sync::<flutter_rust_bridge::for_generated::DcoCodec, _>(
        flutter_rust_bridge::for_generated::TaskInfo {
            debug_name: "DataFrame_get_column_names",
            port: None,
            mode: flutter_rust_bridge::for_generated::FfiCallMode::Sync,
        },
        move || {
            let api_that = that.cst_decode();
            transform_result_dco((move || {
                let api_that = api_that.rust_auto_opaque_decode_ref()?;
                Result::<_, anyhow::Error>::Ok(crate::api::polars::DataFrame::get_column_names(
                    &api_that,
                ))
            })())
        },
    )
}
fn wire_DataFrame_lazy_impl(
    that: impl CstDecode<flutter_rust_bridge::RustOpaque<std::sync::RwLock<DataFrame>>>
        + core::panic::UnwindSafe,
) -> flutter_rust_bridge::for_generated::WireSyncRust2DartDco {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_sync::<flutter_rust_bridge::for_generated::DcoCodec, _>(
        flutter_rust_bridge::for_generated::TaskInfo {
            debug_name: "DataFrame_lazy",
            port: None,
            mode: flutter_rust_bridge::for_generated::FfiCallMode::Sync,
        },
        move || {
            let api_that = that.cst_decode();
            transform_result_dco((move || {
                let api_that = api_that.rust_auto_opaque_decode_owned()?;
                Result::<_, anyhow::Error>::Ok(
                    flutter_rust_bridge::for_generated::rust_auto_opaque_encode(
                        crate::api::polars::DataFrame::lazy(api_that),
                    ),
                )
            })())
        },
    )
}
fn wire_Expr_gt_impl(
    that: impl CstDecode<flutter_rust_bridge::RustOpaque<std::sync::RwLock<Expr>>>
        + core::panic::UnwindSafe,
    other: impl CstDecode<flutter_rust_bridge::RustOpaque<std::sync::RwLock<Expr>>>
        + core::panic::UnwindSafe,
) -> flutter_rust_bridge::for_generated::WireSyncRust2DartDco {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_sync::<flutter_rust_bridge::for_generated::DcoCodec, _>(
        flutter_rust_bridge::for_generated::TaskInfo {
            debug_name: "Expr_gt",
            port: None,
            mode: flutter_rust_bridge::for_generated::FfiCallMode::Sync,
        },
        move || {
            let api_that = that.cst_decode();
            let api_other = other.cst_decode();
            transform_result_dco((move || {
                let api_that = api_that.rust_auto_opaque_decode_owned()?;
                let api_other = api_other.rust_auto_opaque_decode_owned()?;
                Result::<_, anyhow::Error>::Ok(
                    flutter_rust_bridge::for_generated::rust_auto_opaque_encode(
                        crate::api::polars::Expr::gt(api_that, api_other),
                    ),
                )
            })())
        },
    )
}
fn wire_Expr_sum_impl(
    that: impl CstDecode<flutter_rust_bridge::RustOpaque<std::sync::RwLock<Expr>>>
        + core::panic::UnwindSafe,
) -> flutter_rust_bridge::for_generated::WireSyncRust2DartDco {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_sync::<flutter_rust_bridge::for_generated::DcoCodec, _>(
        flutter_rust_bridge::for_generated::TaskInfo {
            debug_name: "Expr_sum",
            port: None,
            mode: flutter_rust_bridge::for_generated::FfiCallMode::Sync,
        },
        move || {
            let api_that = that.cst_decode();
            transform_result_dco((move || {
                let api_that = api_that.rust_auto_opaque_decode_owned()?;
                Result::<_, anyhow::Error>::Ok(
                    flutter_rust_bridge::for_generated::rust_auto_opaque_encode(
                        crate::api::polars::Expr::sum(api_that),
                    ),
                )
            })())
        },
    )
}
fn wire_LazyFrame_collect_impl(
    port_: flutter_rust_bridge::for_generated::MessagePort,
    that: impl CstDecode<flutter_rust_bridge::RustOpaque<std::sync::RwLock<LazyFrame>>>
        + core::panic::UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_normal::<flutter_rust_bridge::for_generated::DcoCodec, _, _>(
        flutter_rust_bridge::for_generated::TaskInfo {
            debug_name: "LazyFrame_collect",
            port: Some(port_),
            mode: flutter_rust_bridge::for_generated::FfiCallMode::Normal,
        },
        move || {
            let api_that = that.cst_decode();
            move |context| {
                transform_result_dco((move || {
                    let api_that = api_that.rust_auto_opaque_decode_owned()?;
                    Result::<_, anyhow::Error>::Ok(
                        flutter_rust_bridge::for_generated::rust_auto_opaque_encode(
                            crate::api::polars::LazyFrame::collect(api_that),
                        ),
                    )
                })())
            }
        },
    )
}
fn wire_LazyFrame_filter_impl(
    that: impl CstDecode<flutter_rust_bridge::RustOpaque<std::sync::RwLock<LazyFrame>>>
        + core::panic::UnwindSafe,
    predicate: impl CstDecode<flutter_rust_bridge::RustOpaque<std::sync::RwLock<Expr>>>
        + core::panic::UnwindSafe,
) -> flutter_rust_bridge::for_generated::WireSyncRust2DartDco {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_sync::<flutter_rust_bridge::for_generated::DcoCodec, _>(
        flutter_rust_bridge::for_generated::TaskInfo {
            debug_name: "LazyFrame_filter",
            port: None,
            mode: flutter_rust_bridge::for_generated::FfiCallMode::Sync,
        },
        move || {
            let api_that = that.cst_decode();
            let api_predicate = predicate.cst_decode();
            transform_result_dco((move || {
                let api_that = api_that.rust_auto_opaque_decode_owned()?;
                let api_predicate = api_predicate.rust_auto_opaque_decode_owned()?;
                Result::<_, anyhow::Error>::Ok(
                    flutter_rust_bridge::for_generated::rust_auto_opaque_encode(
                        crate::api::polars::LazyFrame::filter(api_that, api_predicate),
                    ),
                )
            })())
        },
    )
}
fn wire_LazyFrame_group_by_impl(
    that: impl CstDecode<flutter_rust_bridge::RustOpaque<std::sync::RwLock<LazyFrame>>>
        + core::panic::UnwindSafe,
    expr: impl CstDecode<flutter_rust_bridge::RustOpaque<std::sync::RwLock<Expr>>>
        + core::panic::UnwindSafe,
) -> flutter_rust_bridge::for_generated::WireSyncRust2DartDco {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_sync::<flutter_rust_bridge::for_generated::DcoCodec, _>(
        flutter_rust_bridge::for_generated::TaskInfo {
            debug_name: "LazyFrame_group_by",
            port: None,
            mode: flutter_rust_bridge::for_generated::FfiCallMode::Sync,
        },
        move || {
            let api_that = that.cst_decode();
            let api_expr = expr.cst_decode();
            transform_result_dco((move || {
                let api_that = api_that.rust_auto_opaque_decode_owned()?;
                let api_expr = api_expr.rust_auto_opaque_decode_owned()?;
                Result::<_, anyhow::Error>::Ok(
                    flutter_rust_bridge::for_generated::rust_auto_opaque_encode(
                        crate::api::polars::LazyFrame::group_by(api_that, api_expr),
                    ),
                )
            })())
        },
    )
}
fn wire_LazyGroupBy_agg_impl(
    that: impl CstDecode<flutter_rust_bridge::RustOpaque<std::sync::RwLock<LazyGroupBy>>>
        + core::panic::UnwindSafe,
    expr: impl CstDecode<flutter_rust_bridge::RustOpaque<std::sync::RwLock<Expr>>>
        + core::panic::UnwindSafe,
) -> flutter_rust_bridge::for_generated::WireSyncRust2DartDco {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_sync::<flutter_rust_bridge::for_generated::DcoCodec, _>(
        flutter_rust_bridge::for_generated::TaskInfo {
            debug_name: "LazyGroupBy_agg",
            port: None,
            mode: flutter_rust_bridge::for_generated::FfiCallMode::Sync,
        },
        move || {
            let api_that = that.cst_decode();
            let api_expr = expr.cst_decode();
            transform_result_dco((move || {
                let api_that = api_that.rust_auto_opaque_decode_owned()?;
                let api_expr = api_expr.rust_auto_opaque_decode_owned()?;
                Result::<_, anyhow::Error>::Ok(
                    flutter_rust_bridge::for_generated::rust_auto_opaque_encode(
                        crate::api::polars::LazyGroupBy::agg(api_that, api_expr),
                    ),
                )
            })())
        },
    )
}
fn wire_col_impl(
    name: impl CstDecode<String> + core::panic::UnwindSafe,
) -> flutter_rust_bridge::for_generated::WireSyncRust2DartDco {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_sync::<flutter_rust_bridge::for_generated::DcoCodec, _>(
        flutter_rust_bridge::for_generated::TaskInfo {
            debug_name: "col",
            port: None,
            mode: flutter_rust_bridge::for_generated::FfiCallMode::Sync,
        },
        move || {
            let api_name = name.cst_decode();
            transform_result_dco((move || {
                Result::<_, ()>::Ok(flutter_rust_bridge::for_generated::rust_auto_opaque_encode(
                    crate::api::polars::col(api_name),
                ))
            })())
        },
    )
}
fn wire_lit_impl(
    t: impl CstDecode<f64> + core::panic::UnwindSafe,
) -> flutter_rust_bridge::for_generated::WireSyncRust2DartDco {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_sync::<flutter_rust_bridge::for_generated::DcoCodec, _>(
        flutter_rust_bridge::for_generated::TaskInfo {
            debug_name: "lit",
            port: None,
            mode: flutter_rust_bridge::for_generated::FfiCallMode::Sync,
        },
        move || {
            let api_t = t.cst_decode();
            transform_result_dco((move || {
                Result::<_, ()>::Ok(flutter_rust_bridge::for_generated::rust_auto_opaque_encode(
                    crate::api::polars::lit(api_t),
                ))
            })())
        },
    )
}
fn wire_read_sample_dataset_impl(port_: flutter_rust_bridge::for_generated::MessagePort) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_normal::<flutter_rust_bridge::for_generated::DcoCodec, _, _>(
        flutter_rust_bridge::for_generated::TaskInfo {
            debug_name: "read_sample_dataset",
            port: Some(port_),
            mode: flutter_rust_bridge::for_generated::FfiCallMode::Normal,
        },
        move || {
            move |context| {
                transform_result_dco((move || {
                    Result::<_, ()>::Ok(
                        flutter_rust_bridge::for_generated::rust_auto_opaque_encode(
                            crate::api::polars::read_sample_dataset(),
                        ),
                    )
                })())
            }
        },
    )
}

// Section: dart2rust

impl CstDecode<f64> for f64 {
    fn cst_decode(self) -> f64 {
        self
    }
}
impl CstDecode<i32> for i32 {
    fn cst_decode(self) -> i32 {
        self
    }
}
impl CstDecode<u8> for u8 {
    fn cst_decode(self) -> u8 {
        self
    }
}
impl CstDecode<usize> for usize {
    fn cst_decode(self) -> usize {
        self
    }
}
impl SseDecode for anyhow::Error {
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        unimplemented!("not yet supported in serialized mode, feel free to create an issue");
    }
}

impl SseDecode for flutter_rust_bridge::RustOpaque<std::sync::RwLock<DataFrame>> {
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        let mut inner = <usize>::sse_decode(deserializer);
        return unsafe { flutter_rust_bridge::for_generated::sse_decode_rust_opaque(inner) };
    }
}

impl SseDecode for flutter_rust_bridge::RustOpaque<std::sync::RwLock<Expr>> {
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        let mut inner = <usize>::sse_decode(deserializer);
        return unsafe { flutter_rust_bridge::for_generated::sse_decode_rust_opaque(inner) };
    }
}

impl SseDecode for flutter_rust_bridge::RustOpaque<std::sync::RwLock<LazyFrame>> {
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        let mut inner = <usize>::sse_decode(deserializer);
        return unsafe { flutter_rust_bridge::for_generated::sse_decode_rust_opaque(inner) };
    }
}

impl SseDecode for flutter_rust_bridge::RustOpaque<std::sync::RwLock<LazyGroupBy>> {
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        let mut inner = <usize>::sse_decode(deserializer);
        return unsafe { flutter_rust_bridge::for_generated::sse_decode_rust_opaque(inner) };
    }
}

impl SseDecode for String {
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        let mut inner = <Vec<u8>>::sse_decode(deserializer);
        return String::from_utf8(inner).unwrap();
    }
}

impl SseDecode for f64 {
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        deserializer.cursor.read_f64::<NativeEndian>().unwrap()
    }
}

impl SseDecode for i32 {
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        deserializer.cursor.read_i32::<NativeEndian>().unwrap()
    }
}

impl SseDecode for Vec<String> {
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        let mut len_ = <i32>::sse_decode(deserializer);
        let mut ans_ = vec![];
        for idx_ in 0..len_ {
            ans_.push(<String>::sse_decode(deserializer));
        }
        return ans_;
    }
}

impl SseDecode for Vec<u8> {
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        let mut len_ = <i32>::sse_decode(deserializer);
        let mut ans_ = vec![];
        for idx_ in 0..len_ {
            ans_.push(<u8>::sse_decode(deserializer));
        }
        return ans_;
    }
}

impl SseDecode for crate::api::mandelbrot::Point {
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        let mut var_x = <f64>::sse_decode(deserializer);
        let mut var_y = <f64>::sse_decode(deserializer);
        return crate::api::mandelbrot::Point { x: var_x, y: var_y };
    }
}

impl SseDecode for crate::api::mandelbrot::Size {
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        let mut var_width = <i32>::sse_decode(deserializer);
        let mut var_height = <i32>::sse_decode(deserializer);
        return crate::api::mandelbrot::Size {
            width: var_width,
            height: var_height,
        };
    }
}

impl SseDecode for u8 {
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        deserializer.cursor.read_u8().unwrap()
    }
}

impl SseDecode for () {
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {}
}

impl SseDecode for usize {
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        deserializer.cursor.read_u64::<NativeEndian>().unwrap() as _
    }
}

impl SseDecode for bool {
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        deserializer.cursor.read_u8().unwrap() != 0
    }
}

// Section: rust2dart

impl flutter_rust_bridge::IntoDart for crate::api::mandelbrot::Point {
    fn into_dart(self) -> flutter_rust_bridge::for_generated::DartAbi {
        vec![
            self.x.into_into_dart().into_dart(),
            self.y.into_into_dart().into_dart(),
        ]
        .into_dart()
    }
}
impl flutter_rust_bridge::for_generated::IntoDartExceptPrimitive for crate::api::mandelbrot::Point {}
impl flutter_rust_bridge::IntoIntoDart<crate::api::mandelbrot::Point>
    for crate::api::mandelbrot::Point
{
    fn into_into_dart(self) -> crate::api::mandelbrot::Point {
        self
    }
}
impl flutter_rust_bridge::IntoDart for crate::api::mandelbrot::Size {
    fn into_dart(self) -> flutter_rust_bridge::for_generated::DartAbi {
        vec![
            self.width.into_into_dart().into_dart(),
            self.height.into_into_dart().into_dart(),
        ]
        .into_dart()
    }
}
impl flutter_rust_bridge::for_generated::IntoDartExceptPrimitive for crate::api::mandelbrot::Size {}
impl flutter_rust_bridge::IntoIntoDart<crate::api::mandelbrot::Size>
    for crate::api::mandelbrot::Size
{
    fn into_into_dart(self) -> crate::api::mandelbrot::Size {
        self
    }
}

impl SseEncode for anyhow::Error {
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        <String>::sse_encode(format!("{:?}", self), serializer);
    }
}

impl SseEncode for flutter_rust_bridge::RustOpaque<std::sync::RwLock<DataFrame>> {
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        let (ptr, size) = self.sse_encode_raw();
        <usize>::sse_encode(ptr, serializer);
        <i32>::sse_encode(size, serializer);
    }
}

impl SseEncode for flutter_rust_bridge::RustOpaque<std::sync::RwLock<Expr>> {
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        let (ptr, size) = self.sse_encode_raw();
        <usize>::sse_encode(ptr, serializer);
        <i32>::sse_encode(size, serializer);
    }
}

impl SseEncode for flutter_rust_bridge::RustOpaque<std::sync::RwLock<LazyFrame>> {
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        let (ptr, size) = self.sse_encode_raw();
        <usize>::sse_encode(ptr, serializer);
        <i32>::sse_encode(size, serializer);
    }
}

impl SseEncode for flutter_rust_bridge::RustOpaque<std::sync::RwLock<LazyGroupBy>> {
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        let (ptr, size) = self.sse_encode_raw();
        <usize>::sse_encode(ptr, serializer);
        <i32>::sse_encode(size, serializer);
    }
}

impl SseEncode for String {
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        <Vec<u8>>::sse_encode(self.into_bytes(), serializer);
    }
}

impl SseEncode for f64 {
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        serializer.cursor.write_f64::<NativeEndian>(self).unwrap();
    }
}

impl SseEncode for i32 {
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        serializer.cursor.write_i32::<NativeEndian>(self).unwrap();
    }
}

impl SseEncode for Vec<String> {
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        <i32>::sse_encode(self.len() as _, serializer);
        for item in self {
            <String>::sse_encode(item, serializer);
        }
    }
}

impl SseEncode for Vec<u8> {
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        <i32>::sse_encode(self.len() as _, serializer);
        for item in self {
            <u8>::sse_encode(item, serializer);
        }
    }
}

impl SseEncode for crate::api::mandelbrot::Point {
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        <f64>::sse_encode(self.x, serializer);
        <f64>::sse_encode(self.y, serializer);
    }
}

impl SseEncode for crate::api::mandelbrot::Size {
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        <i32>::sse_encode(self.width, serializer);
        <i32>::sse_encode(self.height, serializer);
    }
}

impl SseEncode for u8 {
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        serializer.cursor.write_u8(self).unwrap();
    }
}

impl SseEncode for () {
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {}
}

impl SseEncode for usize {
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        serializer
            .cursor
            .write_u64::<NativeEndian>(self as _)
            .unwrap();
    }
}

impl SseEncode for bool {
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        serializer.cursor.write_u8(self as _).unwrap();
    }
}

#[cfg(not(target_family = "wasm"))]
#[path = "frb_generated.io.rs"]
mod io;
#[cfg(not(target_family = "wasm"))]
pub use io::*;

/// cbindgen:ignore
#[cfg(target_family = "wasm")]
#[path = "frb_generated.web.rs"]
mod web;
#[cfg(target_family = "wasm")]
pub use web::*;
