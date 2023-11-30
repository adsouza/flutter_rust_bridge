// ignore_for_file: invalid_use_of_internal_member, unused_import

import '../../frb_generated.dart';
import 'package:collection/collection.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

Future<SumWithTwinRustAsync> getSumStructTwinRustAsync({dynamic hint}) =>
    RustLib.instance.api.getSumStructTwinRustAsync(hint: hint);

Future<SumWithTwinRustAsyncArray3> getSumArrayTwinRustAsync(
        {required int a, required int b, required int c, dynamic hint}) =>
    RustLib.instance.api.getSumArrayTwinRustAsync(a: a, b: b, c: c, hint: hint);

class ConcatenateWithTwinRustAsync {
  final String a;

  const ConcatenateWithTwinRustAsync({
    required this.a,
  });

  static Future<String> concatenateStaticTwinRustAsync(
          {required String a, required String b, dynamic hint}) =>
      RustLib.instance.api
          .concatenateWithTwinRustAsyncConcatenateStaticTwinRustAsync(
              a: a, b: b, hint: hint);

  Future<String> concatenateTwinRustAsync({required String b, dynamic hint}) =>
      RustLib.instance.api.concatenateWithTwinRustAsyncConcatenateTwinRustAsync(
        that: this,
        b: b,
      );

  static Stream<int> handleSomeStaticStreamSinkSingleArgTwinRustAsync(
          {dynamic hint}) =>
      RustLib.instance.api
          .concatenateWithTwinRustAsyncHandleSomeStaticStreamSinkSingleArgTwinRustAsync(
              hint: hint);

  static Stream<Log2TwinRustAsync> handleSomeStaticStreamSinkTwinRustAsync(
          {required int key, required int max, dynamic hint}) =>
      RustLib.instance.api
          .concatenateWithTwinRustAsyncHandleSomeStaticStreamSinkTwinRustAsync(
              key: key, max: max, hint: hint);

  Stream<int> handleSomeStreamSinkAt1TwinRustAsync({dynamic hint}) =>
      RustLib.instance.api
          .concatenateWithTwinRustAsyncHandleSomeStreamSinkAt1TwinRustAsync(
        that: this,
      );

  Stream<Log2TwinRustAsync> handleSomeStreamSinkTwinRustAsync(
          {required int key, required int max, dynamic hint}) =>
      RustLib.instance.api
          .concatenateWithTwinRustAsyncHandleSomeStreamSinkTwinRustAsync(
        that: this,
        key: key,
        max: max,
      );

  static Future<ConcatenateWithTwinRustAsync> newTwinRustAsync(
          {required String a, dynamic hint}) =>
      RustLib.instance.api
          .concatenateWithTwinRustAsyncNewTwinRustAsync(a: a, hint: hint);

  @override
  int get hashCode => a.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConcatenateWithTwinRustAsync &&
          runtimeType == other.runtimeType &&
          a == other.a;
}

class Log2TwinRustAsync {
  final int key;
  final String value;

  const Log2TwinRustAsync({
    required this.key,
    required this.value,
  });

  @override
  int get hashCode => key.hashCode ^ value.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Log2TwinRustAsync &&
          runtimeType == other.runtimeType &&
          key == other.key &&
          value == other.value;
}

class SumWithTwinRustAsync {
  final int x;

  const SumWithTwinRustAsync({
    required this.x,
  });

  Future<int> sumTwinRustAsync(
          {required int y, required int z, dynamic hint}) =>
      RustLib.instance.api.sumWithTwinRustAsyncSumTwinRustAsync(
        that: this,
        y: y,
        z: z,
      );

  @override
  int get hashCode => x.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SumWithTwinRustAsync &&
          runtimeType == other.runtimeType &&
          x == other.x;
}

class SumWithTwinRustAsyncArray3
    extends NonGrowableListView<SumWithTwinRustAsync> {
  static const arraySize = 3;
  SumWithTwinRustAsyncArray3(List<SumWithTwinRustAsync> inner)
      : assert(inner.length == arraySize),
        super(inner);
  SumWithTwinRustAsyncArray3.unchecked(List<SumWithTwinRustAsync> inner)
      : super(inner);
  SumWithTwinRustAsyncArray3.init(SumWithTwinRustAsync fill)
      : super(List<SumWithTwinRustAsync>.filled(arraySize, fill));
}
