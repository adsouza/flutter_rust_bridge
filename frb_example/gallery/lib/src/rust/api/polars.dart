// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.4.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

Future<RwLockDataFrame> readSampleDataset({dynamic hint}) =>
    RustLib.instance.api.readSampleDataset(hint: hint);

RwLockExpr col({required String name, dynamic hint}) =>
    RustLib.instance.api.col(name: name, hint: hint);

RwLockExpr lit({required double t, dynamic hint}) =>
    RustLib.instance.api.lit(t: t, hint: hint);

// Rust type: flutter_rust_bridge::RustOpaque<std::sync::RwLock<DataFrame>>
@sealed
class RwLockDataFrame extends RustOpaque {
  RwLockDataFrame.dcoDecode(dynamic wire) : super.dcoDecode(wire, _kStaticData);

  RwLockDataFrame.sseDecode(int ptr, int externalSizeOnNative)
      : super.sseDecode(ptr, externalSizeOnNative, _kStaticData);

  static final _kStaticData = RustArcStaticData(
    rustArcIncrementStrongCount:
        RustLib.instance.api.rust_arc_increment_strong_count_RwLockDataFrame,
    rustArcDecrementStrongCount:
        RustLib.instance.api.rust_arc_decrement_strong_count_RwLockDataFrame,
    rustArcDecrementStrongCountPtr:
        RustLib.instance.api.rust_arc_decrement_strong_count_RwLockDataFramePtr,
  );

  Future<List<String>> getColumn({required String name, dynamic hint}) =>
      RustLib.instance.api.dataFrameGetColumn(
        that: this,
        name: name,
      );

  List<String> getColumnNames({dynamic hint}) =>
      RustLib.instance.api.dataFrameGetColumnNames(
        that: this,
      );

  RwLockLazyFrame lazy({dynamic hint}) => RustLib.instance.api.dataFrameLazy(
        that: this,
      );
}

// Rust type: flutter_rust_bridge::RustOpaque<std::sync::RwLock<Expr>>
@sealed
class RwLockExpr extends RustOpaque {
  RwLockExpr.dcoDecode(dynamic wire) : super.dcoDecode(wire, _kStaticData);

  RwLockExpr.sseDecode(int ptr, int externalSizeOnNative)
      : super.sseDecode(ptr, externalSizeOnNative, _kStaticData);

  static final _kStaticData = RustArcStaticData(
    rustArcIncrementStrongCount:
        RustLib.instance.api.rust_arc_increment_strong_count_RwLockExpr,
    rustArcDecrementStrongCount:
        RustLib.instance.api.rust_arc_decrement_strong_count_RwLockExpr,
    rustArcDecrementStrongCountPtr:
        RustLib.instance.api.rust_arc_decrement_strong_count_RwLockExprPtr,
  );

  RwLockExpr gt({required RwLockExpr other, dynamic hint}) =>
      RustLib.instance.api.exprGt(
        that: this,
        other: other,
      );

  RwLockExpr sum({dynamic hint}) => RustLib.instance.api.exprSum(
        that: this,
      );
}

// Rust type: flutter_rust_bridge::RustOpaque<std::sync::RwLock<LazyFrame>>
@sealed
class RwLockLazyFrame extends RustOpaque {
  RwLockLazyFrame.dcoDecode(dynamic wire) : super.dcoDecode(wire, _kStaticData);

  RwLockLazyFrame.sseDecode(int ptr, int externalSizeOnNative)
      : super.sseDecode(ptr, externalSizeOnNative, _kStaticData);

  static final _kStaticData = RustArcStaticData(
    rustArcIncrementStrongCount:
        RustLib.instance.api.rust_arc_increment_strong_count_RwLockLazyFrame,
    rustArcDecrementStrongCount:
        RustLib.instance.api.rust_arc_decrement_strong_count_RwLockLazyFrame,
    rustArcDecrementStrongCountPtr:
        RustLib.instance.api.rust_arc_decrement_strong_count_RwLockLazyFramePtr,
  );

  Future<RwLockDataFrame> collect({dynamic hint}) =>
      RustLib.instance.api.lazyFrameCollect(
        that: this,
      );

  RwLockLazyFrame filter({required RwLockExpr predicate, dynamic hint}) =>
      RustLib.instance.api.lazyFrameFilter(
        that: this,
        predicate: predicate,
      );

  RwLockLazyGroupBy groupBy({required RwLockExpr expr, dynamic hint}) =>
      RustLib.instance.api.lazyFrameGroupBy(
        that: this,
        expr: expr,
      );
}

// Rust type: flutter_rust_bridge::RustOpaque<std::sync::RwLock<LazyGroupBy>>
@sealed
class RwLockLazyGroupBy extends RustOpaque {
  RwLockLazyGroupBy.dcoDecode(dynamic wire)
      : super.dcoDecode(wire, _kStaticData);

  RwLockLazyGroupBy.sseDecode(int ptr, int externalSizeOnNative)
      : super.sseDecode(ptr, externalSizeOnNative, _kStaticData);

  static final _kStaticData = RustArcStaticData(
    rustArcIncrementStrongCount:
        RustLib.instance.api.rust_arc_increment_strong_count_RwLockLazyGroupBy,
    rustArcDecrementStrongCount:
        RustLib.instance.api.rust_arc_decrement_strong_count_RwLockLazyGroupBy,
    rustArcDecrementStrongCountPtr: RustLib
        .instance.api.rust_arc_decrement_strong_count_RwLockLazyGroupByPtr,
  );

  RwLockLazyFrame agg({required RwLockExpr expr, dynamic hint}) =>
      RustLib.instance.api.lazyGroupByAgg(
        that: this,
        expr: expr,
      );
}
