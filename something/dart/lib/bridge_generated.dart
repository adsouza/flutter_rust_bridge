// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`.

// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas, slash_for_doc_comments, prefer_const_literals_to_create_immutables, implicit_dynamic_list_literal, duplicate_import, unused_import, prefer_single_quotes, prefer_const_constructors, use_super_parameters, always_use_package_imports

import 'dart:convert';
import 'dart:typed_data';

import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'dart:ffi' as ffi;

abstract class Something {
  Future<StructWithMethod> newStaticMethodStructWithMethod(
      {required String something, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kNewStaticMethodStructWithMethodConstMeta;

  Future<void> doSomethingMethod(
      {required StructWithMethod structWithMethod,
      required int u,
      required String x,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDoSomethingMethodConstMeta;

  Future<void> doMoreStuffMethod(
      {required StructWithMethod structWithMethod, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDoMoreStuffMethodConstMeta;

  Future<void> doHugeStuffMethod(
      {required StructWithMethod structWithMethod,
      required String s,
      required OtherStruct a,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDoHugeStuffMethodConstMeta;

  Future<StructWithMethod> returnStruct({dynamic hint});

  FlutterRustBridgeTaskConstMeta get kReturnStructConstMeta;

  Future<TestStruct> returnTestStruct({dynamic hint});

  FlutterRustBridgeTaskConstMeta get kReturnTestStructConstMeta;
}

class OtherStruct {
  final int u;

  OtherStruct({
    required this.u,
  });
}

class StructWithMethod {
  final Something bridge;
  final String something;

  StructWithMethod({
    required this.bridge,
    required this.something,
  });
  Future<void> doSomething({required int u, required String x, dynamic hint}) =>
      bridge.doSomethingMethod(
        structWithMethod: this,
        u: u,
        x: x,
      );
  Future<void> doMoreStuff({dynamic hint}) => bridge.doMoreStuffMethod(
        structWithMethod: this,
      );
  Future<void> doHugeStuff(
          {required String s, required OtherStruct a, dynamic hint}) =>
      bridge.doHugeStuffMethod(
        structWithMethod: this,
        s: s,
        a: a,
      );
}

class TestStruct {
  final String testVariable;

  TestStruct({
    required this.testVariable,
  });
}

class SomethingImpl extends FlutterRustBridgeBase<SomethingWire>
    implements Something {
  factory SomethingImpl(ffi.DynamicLibrary dylib) =>
      SomethingImpl.raw(SomethingWire(dylib));

  SomethingImpl.raw(SomethingWire inner) : super(inner);

  Future<StructWithMethod> newStaticMethodStructWithMethod(
          {required String something, dynamic hint}) =>
      executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) => inner.wire_new__static_method___StructWithMethod(
            port_, _api2wire_String(something)),
        parseSuccessData: (d) => _wire2api_struct_with_method(this, d),
        constMeta: kNewStaticMethodStructWithMethodConstMeta,
        argValues: [something],
        hint: hint,
      ));

  FlutterRustBridgeTaskConstMeta
      get kNewStaticMethodStructWithMethodConstMeta =>
          const FlutterRustBridgeTaskConstMeta(
            debugName: "new__static_method___StructWithMethod",
            argNames: ["something"],
          );

  Future<void> doSomethingMethod(
          {required StructWithMethod structWithMethod,
          required int u,
          required String x,
          dynamic hint}) =>
      executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) => inner.wire_do_something__method(
            port_,
            _api2wire_box_autoadd_struct_with_method(structWithMethod),
            _api2wire_u32(u),
            _api2wire_String(x)),
        parseSuccessData: _wire2api_unit,
        constMeta: kDoSomethingMethodConstMeta,
        argValues: [structWithMethod, u, x],
        hint: hint,
      ));

  FlutterRustBridgeTaskConstMeta get kDoSomethingMethodConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "do_something__method",
        argNames: ["structWithMethod", "u", "x"],
      );

  Future<void> doMoreStuffMethod(
          {required StructWithMethod structWithMethod, dynamic hint}) =>
      executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) => inner.wire_do_more_stuff__method(
            port_, _api2wire_box_autoadd_struct_with_method(structWithMethod)),
        parseSuccessData: _wire2api_unit,
        constMeta: kDoMoreStuffMethodConstMeta,
        argValues: [structWithMethod],
        hint: hint,
      ));

  FlutterRustBridgeTaskConstMeta get kDoMoreStuffMethodConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "do_more_stuff__method",
        argNames: ["structWithMethod"],
      );

  Future<void> doHugeStuffMethod(
          {required StructWithMethod structWithMethod,
          required String s,
          required OtherStruct a,
          dynamic hint}) =>
      executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) => inner.wire_do_huge_stuff__method(
            port_,
            _api2wire_box_autoadd_struct_with_method(structWithMethod),
            _api2wire_String(s),
            _api2wire_box_autoadd_other_struct(a)),
        parseSuccessData: _wire2api_unit,
        constMeta: kDoHugeStuffMethodConstMeta,
        argValues: [structWithMethod, s, a],
        hint: hint,
      ));

  FlutterRustBridgeTaskConstMeta get kDoHugeStuffMethodConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "do_huge_stuff__method",
        argNames: ["structWithMethod", "s", "a"],
      );

  Future<StructWithMethod> returnStruct({dynamic hint}) =>
      executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) => inner.wire_return_struct(port_),
        parseSuccessData: (d) => _wire2api_struct_with_method(this, d),
        constMeta: kReturnStructConstMeta,
        argValues: [],
        hint: hint,
      ));

  FlutterRustBridgeTaskConstMeta get kReturnStructConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "return_struct",
        argNames: [],
      );

  Future<TestStruct> returnTestStruct({dynamic hint}) =>
      executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) => inner.wire_return_test_struct(port_),
        parseSuccessData: _wire2api_test_struct,
        constMeta: kReturnTestStructConstMeta,
        argValues: [],
        hint: hint,
      ));

  FlutterRustBridgeTaskConstMeta get kReturnTestStructConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "return_test_struct",
        argNames: [],
      );

  // Section: api2wire
  ffi.Pointer<wire_uint_8_list> _api2wire_String(String raw) {
    return _api2wire_uint_8_list(utf8.encoder.convert(raw));
  }

  ffi.Pointer<wire_OtherStruct> _api2wire_box_autoadd_other_struct(
      OtherStruct raw) {
    final ptr = inner.new_box_autoadd_other_struct();
    _api_fill_to_wire_other_struct(raw, ptr.ref);
    return ptr;
  }

  ffi.Pointer<wire_StructWithMethod> _api2wire_box_autoadd_struct_with_method(
      StructWithMethod raw) {
    final ptr = inner.new_box_autoadd_struct_with_method();
    _api_fill_to_wire_struct_with_method(raw, ptr.ref);
    return ptr;
  }

  int _api2wire_u32(int raw) {
    return raw;
  }

  int _api2wire_u8(int raw) {
    return raw;
  }

  ffi.Pointer<wire_uint_8_list> _api2wire_uint_8_list(Uint8List raw) {
    final ans = inner.new_uint_8_list(raw.length);
    ans.ref.ptr.asTypedList(raw.length).setAll(0, raw);
    return ans;
  }

  // Section: api_fill_to_wire

  void _api_fill_to_wire_box_autoadd_other_struct(
      OtherStruct apiObj, ffi.Pointer<wire_OtherStruct> wireObj) {
    _api_fill_to_wire_other_struct(apiObj, wireObj.ref);
  }

  void _api_fill_to_wire_box_autoadd_struct_with_method(
      StructWithMethod apiObj, ffi.Pointer<wire_StructWithMethod> wireObj) {
    _api_fill_to_wire_struct_with_method(apiObj, wireObj.ref);
  }

  void _api_fill_to_wire_other_struct(
      OtherStruct apiObj, wire_OtherStruct wireObj) {
    wireObj.u = _api2wire_u32(apiObj.u);
  }

  void _api_fill_to_wire_struct_with_method(
      StructWithMethod apiObj, wire_StructWithMethod wireObj) {
    wireObj.something = _api2wire_String(apiObj.something);
  }
}

// Section: wire2api
String _wire2api_String(dynamic raw) {
  return raw as String;
}

StructWithMethod _wire2api_struct_with_method(Something bridge, dynamic raw) {
  final arr = raw as List<dynamic>;
  if (arr.length != 1)
    throw Exception('unexpected arr length: expect 1 but see ${arr.length}');
  return StructWithMethod(
    something: _wire2api_String(arr[0]),
  );
}

TestStruct _wire2api_test_struct(dynamic raw) {
  final arr = raw as List<dynamic>;
  if (arr.length != 1)
    throw Exception('unexpected arr length: expect 1 but see ${arr.length}');
  return TestStruct(
    testVariable: _wire2api_String(arr[0]),
  );
}

int _wire2api_u8(dynamic raw) {
  return raw as int;
}

Uint8List _wire2api_uint_8_list(dynamic raw) {
  return raw as Uint8List;
}

void _wire2api_unit(dynamic raw) {
  return;
}

// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_positional_boolean_parameters, annotate_overrides, constant_identifier_names

// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.

/// generated by flutter_rust_bridge
class SomethingWire implements FlutterRustBridgeWireBase {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  SomethingWire(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  SomethingWire.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  void wire_new__static_method___StructWithMethod(
    int port_,
    ffi.Pointer<wire_uint_8_list> something,
  ) {
    return _wire_new__static_method___StructWithMethod(
      port_,
      something,
    );
  }

  late final _wire_new__static_method___StructWithMethodPtr = _lookup<
          ffi.NativeFunction<
              ffi.Void Function(ffi.Int64, ffi.Pointer<wire_uint_8_list>)>>(
      'wire_new__static_method___StructWithMethod');
  late final _wire_new__static_method___StructWithMethod =
      _wire_new__static_method___StructWithMethodPtr
          .asFunction<void Function(int, ffi.Pointer<wire_uint_8_list>)>();

  void wire_do_something__method(
    int port_,
    ffi.Pointer<wire_StructWithMethod> StructWithMethod,
    int _u,
    ffi.Pointer<wire_uint_8_list> _x,
  ) {
    return _wire_do_something__method(
      port_,
      StructWithMethod,
      _u,
      _x,
    );
  }

  late final _wire_do_something__methodPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              ffi.Int64,
              ffi.Pointer<wire_StructWithMethod>,
              ffi.Uint32,
              ffi.Pointer<wire_uint_8_list>)>>('wire_do_something__method');
  late final _wire_do_something__method =
      _wire_do_something__methodPtr.asFunction<
          void Function(int, ffi.Pointer<wire_StructWithMethod>, int,
              ffi.Pointer<wire_uint_8_list>)>();

  void wire_do_more_stuff__method(
    int port_,
    ffi.Pointer<wire_StructWithMethod> StructWithMethod,
  ) {
    return _wire_do_more_stuff__method(
      port_,
      StructWithMethod,
    );
  }

  late final _wire_do_more_stuff__methodPtr = _lookup<
          ffi.NativeFunction<
              ffi.Void Function(
                  ffi.Int64, ffi.Pointer<wire_StructWithMethod>)>>(
      'wire_do_more_stuff__method');
  late final _wire_do_more_stuff__method = _wire_do_more_stuff__methodPtr
      .asFunction<void Function(int, ffi.Pointer<wire_StructWithMethod>)>();

  void wire_do_huge_stuff__method(
    int port_,
    ffi.Pointer<wire_StructWithMethod> StructWithMethod,
    ffi.Pointer<wire_uint_8_list> s,
    ffi.Pointer<wire_OtherStruct> a,
  ) {
    return _wire_do_huge_stuff__method(
      port_,
      StructWithMethod,
      s,
      a,
    );
  }

  late final _wire_do_huge_stuff__methodPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              ffi.Int64,
              ffi.Pointer<wire_StructWithMethod>,
              ffi.Pointer<wire_uint_8_list>,
              ffi.Pointer<wire_OtherStruct>)>>('wire_do_huge_stuff__method');
  late final _wire_do_huge_stuff__method =
      _wire_do_huge_stuff__methodPtr.asFunction<
          void Function(int, ffi.Pointer<wire_StructWithMethod>,
              ffi.Pointer<wire_uint_8_list>, ffi.Pointer<wire_OtherStruct>)>();

  void wire_return_struct(
    int port_,
  ) {
    return _wire_return_struct(
      port_,
    );
  }

  late final _wire_return_structPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>(
          'wire_return_struct');
  late final _wire_return_struct =
      _wire_return_structPtr.asFunction<void Function(int)>();

  void wire_return_test_struct(
    int port_,
  ) {
    return _wire_return_test_struct(
      port_,
    );
  }

  late final _wire_return_test_structPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>(
          'wire_return_test_struct');
  late final _wire_return_test_struct =
      _wire_return_test_structPtr.asFunction<void Function(int)>();

  ffi.Pointer<wire_OtherStruct> new_box_autoadd_other_struct() {
    return _new_box_autoadd_other_struct();
  }

  late final _new_box_autoadd_other_structPtr =
      _lookup<ffi.NativeFunction<ffi.Pointer<wire_OtherStruct> Function()>>(
          'new_box_autoadd_other_struct');
  late final _new_box_autoadd_other_struct = _new_box_autoadd_other_structPtr
      .asFunction<ffi.Pointer<wire_OtherStruct> Function()>();

  ffi.Pointer<wire_StructWithMethod> new_box_autoadd_struct_with_method() {
    return _new_box_autoadd_struct_with_method();
  }

  late final _new_box_autoadd_struct_with_methodPtr = _lookup<
          ffi.NativeFunction<ffi.Pointer<wire_StructWithMethod> Function()>>(
      'new_box_autoadd_struct_with_method');
  late final _new_box_autoadd_struct_with_method =
      _new_box_autoadd_struct_with_methodPtr
          .asFunction<ffi.Pointer<wire_StructWithMethod> Function()>();

  ffi.Pointer<wire_uint_8_list> new_uint_8_list(
    int len,
  ) {
    return _new_uint_8_list(
      len,
    );
  }

  late final _new_uint_8_listPtr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<wire_uint_8_list> Function(
              ffi.Int32)>>('new_uint_8_list');
  late final _new_uint_8_list = _new_uint_8_listPtr
      .asFunction<ffi.Pointer<wire_uint_8_list> Function(int)>();

  void free_WireSyncReturnStruct(
    WireSyncReturnStruct val,
  ) {
    return _free_WireSyncReturnStruct(
      val,
    );
  }

  late final _free_WireSyncReturnStructPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(WireSyncReturnStruct)>>(
          'free_WireSyncReturnStruct');
  late final _free_WireSyncReturnStruct = _free_WireSyncReturnStructPtr
      .asFunction<void Function(WireSyncReturnStruct)>();

  void store_dart_post_cobject(
    DartPostCObjectFnType ptr,
  ) {
    return _store_dart_post_cobject(
      ptr,
    );
  }

  late final _store_dart_post_cobjectPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(DartPostCObjectFnType)>>(
          'store_dart_post_cobject');
  late final _store_dart_post_cobject = _store_dart_post_cobjectPtr
      .asFunction<void Function(DartPostCObjectFnType)>();
}

class wire_uint_8_list extends ffi.Struct {
  external ffi.Pointer<ffi.Uint8> ptr;

  @ffi.Int32()
  external int len;
}

class wire_StructWithMethod extends ffi.Struct {
  external ffi.Pointer<wire_uint_8_list> something;
}

class wire_OtherStruct extends ffi.Struct {
  @ffi.Uint32()
  external int u;
}

typedef DartPostCObjectFnType = ffi.Pointer<
    ffi.NativeFunction<ffi.Bool Function(DartPort, ffi.Pointer<ffi.Void>)>>;
typedef DartPort = ffi.Int64;
