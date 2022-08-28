//! Functions that support auto-generated Rust code.
//! These functions are *not* meant to be used by humans directly.
#![doc(hidden)]

use std::mem;

pub use crate::ffi::*;
pub use lazy_static::lazy_static;

pub use crate::handler::DefaultHandler;

// ref https://stackoverflow.com/questions/39224904/how-to-expose-a-rust-vect-to-ffi
pub fn new_leak_vec_ptr<T: Clone>(fill: T, length: i32) -> *mut T {
    into_leak_vec_ptr(vec![fill; length as usize]).0
}

pub fn into_leak_vec_ptr<T: Clone>(mut v: Vec<T>) -> (*mut T, i32) {
    v.shrink_to_fit();
    assert!(v.len() == v.capacity());
    let ptr = v.as_mut_ptr();
    let len = v.len() as i32;
    mem::forget(v);
    (ptr, len)
}

/// # Safety
/// Use it in pair with [new_leak_vec_ptr].
pub unsafe fn vec_from_leak_ptr<T>(ptr: *mut T, len: i32) -> Vec<T> {
    Vec::from_raw_parts(ptr, len as usize, len as usize)
}

// ref: doc of [Box::into_raw]
pub fn new_leak_box_ptr<T>(t: T) -> *mut T {
    let x: Box<T> = Box::new(t);
    Box::into_raw(x)
}

/// # Safety
/// Use it in pair with [new_leak_box_ptr].
pub unsafe fn box_from_leak_ptr<T>(ptr: *mut T) -> Box<T> {
    Box::from_raw(ptr)
}

mod sealed {
    pub trait Sealed {}
    impl Sealed for i64 {}
    impl Sealed for u64 {}
}

/// Cast a byte buffer into a boxed slice of the target type without making any copies.
/// Panics if the cast is unsuccessful in debug mode, otherwise an empty slice is returned.
pub fn slice_from_byte_buffer<T: bytemuck::Pod>(buffer: Vec<u8>) -> Box<[T]> {
    let buf = Box::leak(buffer.into_boxed_slice());
    match bytemuck::try_cast_slice_mut(buf) {
        Ok(buf) => unsafe { Box::from_raw(buf) },
        Err(err) => {
            unsafe { core::ptr::drop_in_place(buf) }
            #[cfg(debug_assertions)]
            panic!("{}", err);
            #[cfg(not(debug_assertions))]
            Box::new([])
        }
    }
}

/// NOTE for maintainer: Please keep this struct in sync with `DUMMY_WIRE_CODE_FOR_BINDGEN`
/// in the code generator
#[repr(C)]
#[cfg(not(wasm))]
pub struct WireSyncReturnStruct {
    pub ptr: *mut u8,
    pub len: i32,
    pub success: bool,
}

#[cfg(wasm)]
pub type WireSyncReturnStruct = wasm_bindgen::JsValue;
