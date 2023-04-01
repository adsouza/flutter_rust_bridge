// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.72.1.
// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas, slash_for_doc_comments, prefer_const_literals_to_create_immutables, implicit_dynamic_list_literal, duplicate_import, unused_import, unnecessary_import, prefer_single_quotes, prefer_const_constructors, use_super_parameters, always_use_package_imports, annotate_overrides, invalid_use_of_protected_member, constant_identifier_names, invalid_use_of_internal_member, prefer_is_empty, unnecessary_const

import 'dart:convert';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'package:uuid/uuid.dart';
import 'bridge_generated_api_2.dart';
export 'bridge_generated_api_2.dart';
import 'dart:ffi' as ffi;

class ApiClass2Platform extends FlutterRustBridgeBase<ApiClass2Wire> {
  ApiClass2Platform(ffi.DynamicLibrary dylib) : super(ApiClass2Wire(dylib));

// Section: api2wire

  @protected
  ffi.Pointer<wire_OnlyForApi2Struct> api2wire_box_autoadd_only_for_api_2_struct(OnlyForApi2Struct raw) {
    final ptr = inner.new_box_autoadd_only_for_api_2_struct();
    _api_fill_to_wire_only_for_api_2_struct(raw, ptr.ref);
    return ptr;
  }

  @protected
  int api2wire_i64(int raw) {
    return raw;
  }

// Section: finalizer

// Section: api_fill_to_wire

  void _api_fill_to_wire_box_autoadd_only_for_api_2_struct(
      OnlyForApi2Struct apiObj, ffi.Pointer<wire_OnlyForApi2Struct> wireObj) {
    _api_fill_to_wire_only_for_api_2_struct(apiObj, wireObj.ref);
  }

  void _api_fill_to_wire_only_for_api_2_struct(OnlyForApi2Struct apiObj, wire_OnlyForApi2Struct wireObj) {
    wireObj.id = api2wire_i64(apiObj.id);
    wireObj.num = api2wire_f64(apiObj.num);
    wireObj.name = api2wire_String(apiObj.name);
  }
}

// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_positional_boolean_parameters, annotate_overrides, constant_identifier_names

// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
// ignore_for_file: type=lint

/// generated by flutter_rust_bridge
class ApiClass2Wire implements FlutterRustBridgeWireBase {
  @internal
  late final dartApi = DartApiDl(init_frb_dart_api_dl);

  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName) _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  ApiClass2Wire(ffi.DynamicLibrary dynamicLibrary) : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  ApiClass2Wire.fromLookup(ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName) lookup)
      : _lookup = lookup;

  ffi.Pointer<wire_SharedStruct> new_box_autoadd_shared_struct() {
    return _new_box_autoadd_shared_struct();
  }

  late final _new_box_autoadd_shared_structPtr =
      _lookup<ffi.NativeFunction<ffi.Pointer<wire_SharedStruct> Function()>>('new_box_autoadd_shared_struct');
  late final _new_box_autoadd_shared_struct =
      _new_box_autoadd_shared_structPtr.asFunction<ffi.Pointer<wire_SharedStruct> Function()>();

  ffi.Pointer<wire_uint_8_list> new_uint_8_list(
    int len,
  ) {
    return _new_uint_8_list(
      len,
    );
  }

  late final _new_uint_8_listPtr =
      _lookup<ffi.NativeFunction<ffi.Pointer<wire_uint_8_list> Function(ffi.Int32)>>('new_uint_8_list');
  late final _new_uint_8_list = _new_uint_8_listPtr.asFunction<ffi.Pointer<wire_uint_8_list> Function(int)>();

  void free_WireSyncReturn(
    WireSyncReturn ptr,
  ) {
    return _free_WireSyncReturn(
      ptr,
    );
  }

  late final _free_WireSyncReturnPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(WireSyncReturn)>>('free_WireSyncReturn');
  late final _free_WireSyncReturn = _free_WireSyncReturnPtr.asFunction<void Function(WireSyncReturn)>();

  void store_dart_post_cobject(
    DartPostCObjectFnType ptr,
  ) {
    return _store_dart_post_cobject(
      ptr,
    );
  }

  late final _store_dart_post_cobjectPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(DartPostCObjectFnType)>>('store_dart_post_cobject');
  late final _store_dart_post_cobject = _store_dart_post_cobjectPtr.asFunction<void Function(DartPostCObjectFnType)>();

  Object get_dart_object(
    int ptr,
  ) {
    return _get_dart_object(
      ptr,
    );
  }

  late final _get_dart_objectPtr = _lookup<ffi.NativeFunction<ffi.Handle Function(ffi.UintPtr)>>('get_dart_object');
  late final _get_dart_object = _get_dart_objectPtr.asFunction<Object Function(int)>();

  void drop_dart_object(
    int ptr,
  ) {
    return _drop_dart_object(
      ptr,
    );
  }

  late final _drop_dart_objectPtr = _lookup<ffi.NativeFunction<ffi.Void Function(ffi.UintPtr)>>('drop_dart_object');
  late final _drop_dart_object = _drop_dart_objectPtr.asFunction<void Function(int)>();

  int new_dart_opaque(
    Object handle,
  ) {
    return _new_dart_opaque(
      handle,
    );
  }

  late final _new_dart_opaquePtr = _lookup<ffi.NativeFunction<ffi.UintPtr Function(ffi.Handle)>>('new_dart_opaque');
  late final _new_dart_opaque = _new_dart_opaquePtr.asFunction<int Function(Object)>();

  int init_frb_dart_api_dl(
    ffi.Pointer<ffi.Void> obj,
  ) {
    return _init_frb_dart_api_dl(
      obj,
    );
  }

  late final _init_frb_dart_api_dlPtr =
      _lookup<ffi.NativeFunction<ffi.IntPtr Function(ffi.Pointer<ffi.Void>)>>('init_frb_dart_api_dl');
  late final _init_frb_dart_api_dl = _init_frb_dart_api_dlPtr.asFunction<int Function(ffi.Pointer<ffi.Void>)>();

  void wire_test_inbuilt_type_2(
    int port_,
    int a,
    double b,
  ) {
    return _wire_test_inbuilt_type_2(
      port_,
      a,
      b,
    );
  }

  late final _wire_test_inbuilt_type_2Ptr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64, ffi.Int32, ffi.Float)>>('wire_test_inbuilt_type_2');
  late final _wire_test_inbuilt_type_2 = _wire_test_inbuilt_type_2Ptr.asFunction<void Function(int, int, double)>();

  void wire_test_string_2(
    int port_,
    ffi.Pointer<wire_uint_8_list> s,
    int i,
  ) {
    return _wire_test_string_2(
      port_,
      s,
      i,
    );
  }

  late final _wire_test_string_2Ptr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64, ffi.Pointer<wire_uint_8_list>, ffi.Uint64)>>(
          'wire_test_string_2');
  late final _wire_test_string_2 =
      _wire_test_string_2Ptr.asFunction<void Function(int, ffi.Pointer<wire_uint_8_list>, int)>();

  void wire_test_shared_struct_2(
    int port_,
    ffi.Pointer<wire_SharedStruct> custom,
    ffi.Pointer<wire_uint_8_list> s,
    int i,
  ) {
    return _wire_test_shared_struct_2(
      port_,
      custom,
      s,
      i,
    );
  }

  late final _wire_test_shared_struct_2Ptr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64, ffi.Pointer<wire_SharedStruct>, ffi.Pointer<wire_uint_8_list>,
              ffi.Int32)>>('wire_test_shared_struct_2');
  late final _wire_test_shared_struct_2 = _wire_test_shared_struct_2Ptr
      .asFunction<void Function(int, ffi.Pointer<wire_SharedStruct>, ffi.Pointer<wire_uint_8_list>, int)>();

  void wire_test_unique_struct_2(
    int port_,
    ffi.Pointer<wire_OnlyForApi2Struct> custom,
    ffi.Pointer<wire_uint_8_list> s,
    int i,
  ) {
    return _wire_test_unique_struct_2(
      port_,
      custom,
      s,
      i,
    );
  }

  late final _wire_test_unique_struct_2Ptr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64, ffi.Pointer<wire_OnlyForApi2Struct>, ffi.Pointer<wire_uint_8_list>,
              ffi.Int64)>>('wire_test_unique_struct_2');
  late final _wire_test_unique_struct_2 = _wire_test_unique_struct_2Ptr
      .asFunction<void Function(int, ffi.Pointer<wire_OnlyForApi2Struct>, ffi.Pointer<wire_uint_8_list>, int)>();

  void wire_test_cross_shared_struct_2(
    int port_,
    ffi.Pointer<wire_uint_8_list> name,
  ) {
    return _wire_test_cross_shared_struct_2(
      port_,
      name,
    );
  }

  late final _wire_test_cross_shared_struct_2Ptr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64, ffi.Pointer<wire_uint_8_list>)>>(
          'wire_test_cross_shared_struct_2');
  late final _wire_test_cross_shared_struct_2 =
      _wire_test_cross_shared_struct_2Ptr.asFunction<void Function(int, ffi.Pointer<wire_uint_8_list>)>();

  ffi.Pointer<wire_OnlyForApi2Struct> new_box_autoadd_only_for_api_2_struct() {
    return _new_box_autoadd_only_for_api_2_struct();
  }

  late final _new_box_autoadd_only_for_api_2_structPtr =
      _lookup<ffi.NativeFunction<ffi.Pointer<wire_OnlyForApi2Struct> Function()>>(
          'new_box_autoadd_only_for_api_2_struct');
  late final _new_box_autoadd_only_for_api_2_struct =
      _new_box_autoadd_only_for_api_2_structPtr.asFunction<ffi.Pointer<wire_OnlyForApi2Struct> Function()>();
}

class _Dart_Handle extends ffi.Opaque {}

class wire_uint_8_list extends ffi.Struct {
  external ffi.Pointer<ffi.Uint8> ptr;

  @ffi.Int32()
  external int len;
}

class wire_SharedStruct extends ffi.Struct {
  @ffi.Int32()
  external int id;

  @ffi.Double()
  external double num;

  external ffi.Pointer<wire_uint_8_list> name;
}

class wire_OnlyForApi2Struct extends ffi.Struct {
  @ffi.Int64()
  external int id;

  @ffi.Double()
  external double num;

  external ffi.Pointer<wire_uint_8_list> name;
}

typedef DartPostCObjectFnType = ffi.Pointer<ffi.NativeFunction<ffi.Bool Function(DartPort, ffi.Pointer<ffi.Void>)>>;
typedef DartPort = ffi.Int64;
