// NOTE: This file is mimicking how a human developer writes tests,
// and is auto-generated from `dart_dynamic.rs` by frb_internal
// Please do not modify manually, but modify the origin and re-run frb_internal generator

use flutter_rust_bridge::{DartDynamic, IntoDart};

#[flutter_rust_bridge::frb(serialize)]
#[flutter_rust_bridge::frb(sync)]
pub fn return_dart_dynamic_twin_sync_sse() -> DartDynamic {
    vec!["foo".into_dart()].into_dart()
}
