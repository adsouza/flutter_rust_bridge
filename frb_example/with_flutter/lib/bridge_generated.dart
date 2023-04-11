// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.72.1.
// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas, slash_for_doc_comments, prefer_const_literals_to_create_immutables, implicit_dynamic_list_literal, duplicate_import, unused_import, unnecessary_import, prefer_single_quotes, prefer_const_constructors, use_super_parameters, always_use_package_imports, annotate_overrides, invalid_use_of_protected_member, constant_identifier_names, invalid_use_of_internal_member, prefer_is_empty, unnecessary_const

import "bridge_definitions.dart";
import 'dart:convert';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'package:uuid/uuid.dart';
import 'bridge_generated.io.dart' if (dart.library.html) 'bridge_generated.web.dart';

class FlutterRustBridgeExampleImpl implements FlutterRustBridgeExample {
  final FlutterRustBridgeExamplePlatform _platform;
  factory FlutterRustBridgeExampleImpl(ExternalLibrary dylib) =>
      FlutterRustBridgeExampleImpl.raw(FlutterRustBridgeExamplePlatform(dylib));
  FlutterRustBridgeExampleImpl.raw(this._platform);

  /// Only valid on web/WASM platforms.
  factory FlutterRustBridgeExampleImpl.wasm(FutureOr<WasmModule> module) =>
      FlutterRustBridgeExampleImpl(module as ExternalLibrary);

  Future<Uint8List> drawMandelbrot(
      {required Size imageSize,
      required Point zoomPoint,
      required double scale,
      required int numThreads,
      dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_size(imageSize);
    var arg1 = _platform.api2wire_box_autoadd_point(zoomPoint);
    var arg2 = api2wire_f64(scale);
    var arg3 = api2wire_i32(numThreads);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_draw_mandelbrot(port_, arg0, arg1, arg2, arg3),
      parseSuccessData: _wire2api_ZeroCopyBuffer_Uint8List,
      constMeta: kDrawMandelbrotConstMeta,
      argValues: [imageSize, zoomPoint, scale, numThreads],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDrawMandelbrotConstMeta => const FlutterRustBridgeTaskConstMeta(
        debugName: "draw_mandelbrot",
        argNames: ["imageSize", "zoomPoint", "scale", "numThreads"],
      );

  Future<String> passingComplexStructs({required TreeNode root, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_tree_node(root);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_passing_complex_structs(port_, arg0),
      parseSuccessData: _wire2api_String,
      constMeta: kPassingComplexStructsConstMeta,
      argValues: [root],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kPassingComplexStructsConstMeta => const FlutterRustBridgeTaskConstMeta(
        debugName: "passing_complex_structs",
        argNames: ["root"],
      );

  Future<BoxedPoint> returningStructsWithBoxedFields({dynamic hint}) {
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_returning_structs_with_boxed_fields(port_),
      parseSuccessData: _wire2api_boxed_point,
      constMeta: kReturningStructsWithBoxedFieldsConstMeta,
      argValues: [],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kReturningStructsWithBoxedFieldsConstMeta => const FlutterRustBridgeTaskConstMeta(
        debugName: "returning_structs_with_boxed_fields",
        argNames: [],
      );

  Future<int> offTopicMemoryTestInputArray({required Uint8List input, dynamic hint}) {
    var arg0 = _platform.api2wire_uint_8_list(input);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_off_topic_memory_test_input_array(port_, arg0),
      parseSuccessData: _wire2api_i32,
      constMeta: kOffTopicMemoryTestInputArrayConstMeta,
      argValues: [input],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kOffTopicMemoryTestInputArrayConstMeta => const FlutterRustBridgeTaskConstMeta(
        debugName: "off_topic_memory_test_input_array",
        argNames: ["input"],
      );

  Future<Uint8List> offTopicMemoryTestOutputZeroCopyBuffer({required int len, dynamic hint}) {
    var arg0 = api2wire_i32(len);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_off_topic_memory_test_output_zero_copy_buffer(port_, arg0),
      parseSuccessData: _wire2api_ZeroCopyBuffer_Uint8List,
      constMeta: kOffTopicMemoryTestOutputZeroCopyBufferConstMeta,
      argValues: [len],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kOffTopicMemoryTestOutputZeroCopyBufferConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "off_topic_memory_test_output_zero_copy_buffer",
        argNames: ["len"],
      );

  Future<Uint8List> offTopicMemoryTestOutputVecU8({required int len, dynamic hint}) {
    var arg0 = api2wire_i32(len);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_off_topic_memory_test_output_vec_u8(port_, arg0),
      parseSuccessData: _wire2api_uint_8_list,
      constMeta: kOffTopicMemoryTestOutputVecU8ConstMeta,
      argValues: [len],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kOffTopicMemoryTestOutputVecU8ConstMeta => const FlutterRustBridgeTaskConstMeta(
        debugName: "off_topic_memory_test_output_vec_u8",
        argNames: ["len"],
      );

  Future<int> offTopicMemoryTestInputVecOfObject({required List<Size> input, dynamic hint}) {
    var arg0 = _platform.api2wire_list_size(input);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_off_topic_memory_test_input_vec_of_object(port_, arg0),
      parseSuccessData: _wire2api_i32,
      constMeta: kOffTopicMemoryTestInputVecOfObjectConstMeta,
      argValues: [input],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kOffTopicMemoryTestInputVecOfObjectConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "off_topic_memory_test_input_vec_of_object",
        argNames: ["input"],
      );

  Future<List<Size>> offTopicMemoryTestOutputVecOfObject({required int len, dynamic hint}) {
    var arg0 = api2wire_i32(len);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_off_topic_memory_test_output_vec_of_object(port_, arg0),
      parseSuccessData: _wire2api_list_size,
      constMeta: kOffTopicMemoryTestOutputVecOfObjectConstMeta,
      argValues: [len],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kOffTopicMemoryTestOutputVecOfObjectConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "off_topic_memory_test_output_vec_of_object",
        argNames: ["len"],
      );

  Future<int> offTopicMemoryTestInputComplexStruct({required TreeNode input, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_tree_node(input);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_off_topic_memory_test_input_complex_struct(port_, arg0),
      parseSuccessData: _wire2api_i32,
      constMeta: kOffTopicMemoryTestInputComplexStructConstMeta,
      argValues: [input],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kOffTopicMemoryTestInputComplexStructConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "off_topic_memory_test_input_complex_struct",
        argNames: ["input"],
      );

  Future<TreeNode> offTopicMemoryTestOutputComplexStruct({required int len, dynamic hint}) {
    var arg0 = api2wire_i32(len);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_off_topic_memory_test_output_complex_struct(port_, arg0),
      parseSuccessData: _wire2api_tree_node,
      constMeta: kOffTopicMemoryTestOutputComplexStructConstMeta,
      argValues: [len],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kOffTopicMemoryTestOutputComplexStructConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "off_topic_memory_test_output_complex_struct",
        argNames: ["len"],
      );

  Future<int> offTopicDeliberatelyReturnError({dynamic hint}) {
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_off_topic_deliberately_return_error(port_),
      parseSuccessData: _wire2api_i32,
      constMeta: kOffTopicDeliberatelyReturnErrorConstMeta,
      argValues: [],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kOffTopicDeliberatelyReturnErrorConstMeta => const FlutterRustBridgeTaskConstMeta(
        debugName: "off_topic_deliberately_return_error",
        argNames: [],
      );

  Future<int> offTopicDeliberatelyPanic({dynamic hint}) {
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_off_topic_deliberately_panic(port_),
      parseSuccessData: _wire2api_i32,
      constMeta: kOffTopicDeliberatelyPanicConstMeta,
      argValues: [],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kOffTopicDeliberatelyPanicConstMeta => const FlutterRustBridgeTaskConstMeta(
        debugName: "off_topic_deliberately_panic",
        argNames: [],
      );

  void dispose() {
    _platform.dispose();
  }
// Section: wire2api

  String _wire2api_String(dynamic raw) {
    return raw as String;
  }

  Uint8List _wire2api_ZeroCopyBuffer_Uint8List(dynamic raw) {
    return raw as Uint8List;
  }

  Point _wire2api_box_point(dynamic raw) {
    return _wire2api_point(raw);
  }

  BoxedPoint _wire2api_boxed_point(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 1) throw Exception('unexpected arr length: expect 1 but see ${arr.length}');
    return BoxedPoint(
      point: _wire2api_box_point(arr[0]),
    );
  }

  double _wire2api_f64(dynamic raw) {
    return raw as double;
  }

  int _wire2api_i32(dynamic raw) {
    return raw as int;
  }

  List<Size> _wire2api_list_size(dynamic raw) {
    return (raw as List<dynamic>).map(_wire2api_size).toList();
  }

  List<TreeNode> _wire2api_list_tree_node(dynamic raw) {
    return (raw as List<dynamic>).map(_wire2api_tree_node).toList();
  }

  Point _wire2api_point(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 2) throw Exception('unexpected arr length: expect 2 but see ${arr.length}');
    return Point(
      x: _wire2api_f64(arr[0]),
      y: _wire2api_f64(arr[1]),
    );
  }

  Size _wire2api_size(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 2) throw Exception('unexpected arr length: expect 2 but see ${arr.length}');
    return Size(
      width: _wire2api_i32(arr[0]),
      height: _wire2api_i32(arr[1]),
    );
  }

  TreeNode _wire2api_tree_node(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 2) throw Exception('unexpected arr length: expect 2 but see ${arr.length}');
    return TreeNode(
      name: _wire2api_String(arr[0]),
      children: _wire2api_list_tree_node(arr[1]),
    );
  }

  int _wire2api_u8(dynamic raw) {
    return raw as int;
  }

  Uint8List _wire2api_uint_8_list(dynamic raw) {
    return raw as Uint8List;
  }
}

// Section: api2wire

@protected
double api2wire_f64(double raw) {
  return raw;
}

@protected
int api2wire_i32(int raw) {
  return raw;
}

@protected
int api2wire_u8(int raw) {
  return raw;
}

// Section: finalizer
