// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.80.1.
// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas, slash_for_doc_comments, prefer_const_literals_to_create_immutables, implicit_dynamic_list_literal, duplicate_import, unused_import, unnecessary_import, prefer_single_quotes, prefer_const_constructors, use_super_parameters, always_use_package_imports, annotate_overrides, invalid_use_of_protected_member, constant_identifier_names, invalid_use_of_internal_member, prefer_is_empty, unnecessary_const

import 'bridge_generated.io.dart' if (dart.library.html) 'bridge_generated.web.dart';
import 'dart:convert';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'package:uuid/uuid.dart';
import 'ffi.io.dart' if (dart.library.html) 'ffi.web.dart';
import 'package:freezed_annotation/freezed_annotation.dart' hide protected;
import 'package:meta/meta.dart' as meta;

part 'bridge_definitions.freezed.dart';

abstract class FlutterRustBridgeExample {
  Future<Uint8List> drawMandelbrot(
      {required Size imageSize,
      required Point zoomPoint,
      required double scale,
      required int numThreads,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDrawMandelbrotConstMeta;

  Future<String> passingComplexStructs({required TreeNode root, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kPassingComplexStructsConstMeta;

  Future<BoxedPoint> returningStructsWithBoxedFields({dynamic hint});

  FlutterRustBridgeTaskConstMeta get kReturningStructsWithBoxedFieldsConstMeta;

  Future<int> offTopicMemoryTestInputArray({required Uint8List input, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kOffTopicMemoryTestInputArrayConstMeta;

  Future<Uint8List> offTopicMemoryTestOutputZeroCopyBuffer({required int len, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kOffTopicMemoryTestOutputZeroCopyBufferConstMeta;

  Future<Uint8List> offTopicMemoryTestOutputVecU8({required int len, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kOffTopicMemoryTestOutputVecU8ConstMeta;

  Future<int> offTopicMemoryTestInputVecOfObject({required List<Size> input, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kOffTopicMemoryTestInputVecOfObjectConstMeta;

  Future<List<Size>> offTopicMemoryTestOutputVecOfObject({required int len, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kOffTopicMemoryTestOutputVecOfObjectConstMeta;

  Future<int> offTopicMemoryTestInputComplexStruct({required TreeNode input, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kOffTopicMemoryTestInputComplexStructConstMeta;

  Future<TreeNode> offTopicMemoryTestOutputComplexStruct({required int len, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kOffTopicMemoryTestOutputComplexStructConstMeta;

  Future<int> offTopicDeliberatelyReturnError({dynamic hint});

  FlutterRustBridgeTaskConstMeta get kOffTopicDeliberatelyReturnErrorConstMeta;

  Future<int> offTopicDeliberatelyPanic({dynamic hint});

  FlutterRustBridgeTaskConstMeta get kOffTopicDeliberatelyPanicConstMeta;

  Future<UserId> nextUserId({required UserId userId, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kNextUserIdConstMeta;

  Future<void> testMethodMethodBoxedPoint({required BoxedPoint that, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kTestMethodMethodBoxedPointConstMeta;

  Future<int> sumMethodSumWith({required SumWith that, required int y, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kSumMethodSumWithConstMeta;

  Future<int> sumStaticStaticMethodSumWith({required int x, required int y, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kSumStaticStaticMethodSumWithConstMeta;
}

class BoxedPoint {
  final Point point;

  const BoxedPoint({
    required this.point,
  });

  Future<void> testMethod({dynamic hint}) => api.testMethodMethodBoxedPoint(
        that: this,
      );
}

class Point {
  final double x;
  final double y;

  const Point({
    required this.x,
    required this.y,
  });
}

class Size {
  final int width;
  final int height;

  const Size({
    required this.width,
    required this.height,
  });
}

class SumWith {
  final int x;

  const SumWith({
    required this.x,
  });

  Future<int> sum({required int y, dynamic hint}) => api.sumMethodSumWith(
        that: this,
        y: y,
      );

  static Future<int> sumStatic({required int x, required int y, dynamic hint}) =>
      api.sumStaticStaticMethodSumWith(x: x, y: y, hint: hint);
}

class TreeNode {
  final String name;
  final List<TreeNode> children;

  const TreeNode({
    required this.name,
    required this.children,
  });
}

@freezed
@meta.immutable
class UserId with _$UserId {
  const factory UserId({
    required int value,
  }) = _UserId;
}
