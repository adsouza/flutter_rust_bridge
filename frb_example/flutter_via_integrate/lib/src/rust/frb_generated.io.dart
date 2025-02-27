// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.4.

// ignore_for_file: unused_import, unused_element, unnecessary_import, duplicate_ignore, invalid_use_of_internal_member, annotate_overrides, non_constant_identifier_names, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables

import 'api/simple.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:ffi' as ffi;
import 'frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated_io.dart';

abstract class RustLibApiImplPlatform extends BaseApiImpl<RustLibWire> {
  RustLibApiImplPlatform({
    required super.handler,
    required super.wire,
    required super.generalizedFrbRustBinding,
    required super.portManager,
  });

  @protected
  String dco_decode_String(dynamic raw);

  @protected
  Uint8List dco_decode_list_prim_u_8(dynamic raw);

  @protected
  int dco_decode_u_8(dynamic raw);

  @protected
  void dco_decode_unit(dynamic raw);

  @protected
  String sse_decode_String(SseDeserializer deserializer);

  @protected
  Uint8List sse_decode_list_prim_u_8(SseDeserializer deserializer);

  @protected
  int sse_decode_u_8(SseDeserializer deserializer);

  @protected
  void sse_decode_unit(SseDeserializer deserializer);

  @protected
  int sse_decode_i_32(SseDeserializer deserializer);

  @protected
  bool sse_decode_bool(SseDeserializer deserializer);

  @protected
  ffi.Pointer<wire_cst_list_prim_u_8> cst_encode_String(String raw) {
    return cst_encode_list_prim_u_8(utf8.encoder.convert(raw));
  }

  @protected
  ffi.Pointer<wire_cst_list_prim_u_8> cst_encode_list_prim_u_8(Uint8List raw) {
    final ans = wire.cst_new_list_prim_u_8(raw.length);
    ans.ref.ptr.asTypedList(raw.length).setAll(0, raw);
    return ans;
  }

  @protected
  int cst_encode_u_8(int raw);

  @protected
  void cst_encode_unit(void raw);

  @protected
  void sse_encode_String(String self, SseSerializer serializer);

  @protected
  void sse_encode_list_prim_u_8(Uint8List self, SseSerializer serializer);

  @protected
  void sse_encode_u_8(int self, SseSerializer serializer);

  @protected
  void sse_encode_unit(void self, SseSerializer serializer);

  @protected
  void sse_encode_i_32(int self, SseSerializer serializer);

  @protected
  void sse_encode_bool(bool self, SseSerializer serializer);
}

// Section: wire_class

// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_positional_boolean_parameters, annotate_overrides, constant_identifier_names
// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
// ignore_for_file: type=lint

/// generated by flutter_rust_bridge
class RustLibWire implements BaseWire {
  factory RustLibWire.fromExternalLibrary(ExternalLibrary lib) =>
      RustLibWire(lib.ffiDynamicLibrary);

  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  RustLibWire(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  RustLibWire.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  void dart_fn_deliver_output(
    int call_id,
    ffi.Pointer<ffi.Uint8> ptr_,
    int rust_vec_len_,
    int data_len_,
  ) {
    return _dart_fn_deliver_output(
      call_id,
      ptr_,
      rust_vec_len_,
      data_len_,
    );
  }

  late final _dart_fn_deliver_outputPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int32, ffi.Pointer<ffi.Uint8>, ffi.Int32,
              ffi.Int32)>>('dart_fn_deliver_output');
  late final _dart_fn_deliver_output = _dart_fn_deliver_outputPtr
      .asFunction<void Function(int, ffi.Pointer<ffi.Uint8>, int, int)>();

  WireSyncRust2DartDco wire_greet(
    ffi.Pointer<wire_cst_list_prim_u_8> name,
  ) {
    return _wire_greet(
      name,
    );
  }

  late final _wire_greetPtr = _lookup<
      ffi.NativeFunction<
          WireSyncRust2DartDco Function(
              ffi.Pointer<wire_cst_list_prim_u_8>)>>('wire_greet');
  late final _wire_greet = _wire_greetPtr.asFunction<
      WireSyncRust2DartDco Function(ffi.Pointer<wire_cst_list_prim_u_8>)>();

  ffi.Pointer<wire_cst_list_prim_u_8> cst_new_list_prim_u_8(
    int len,
  ) {
    return _cst_new_list_prim_u_8(
      len,
    );
  }

  late final _cst_new_list_prim_u_8Ptr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<wire_cst_list_prim_u_8> Function(
              ffi.Int32)>>('cst_new_list_prim_u_8');
  late final _cst_new_list_prim_u_8 = _cst_new_list_prim_u_8Ptr
      .asFunction<ffi.Pointer<wire_cst_list_prim_u_8> Function(int)>();

  int dummy_method_to_enforce_bundling() {
    return _dummy_method_to_enforce_bundling();
  }

  late final _dummy_method_to_enforce_bundlingPtr =
      _lookup<ffi.NativeFunction<ffi.Int64 Function()>>(
          'dummy_method_to_enforce_bundling');
  late final _dummy_method_to_enforce_bundling =
      _dummy_method_to_enforce_bundlingPtr.asFunction<int Function()>();
}

final class wire_cst_list_prim_u_8 extends ffi.Struct {
  external ffi.Pointer<ffi.Uint8> ptr;

  @ffi.Int32()
  external int len;
}
