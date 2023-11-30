// ignore_for_file: invalid_use_of_internal_member, unused_import

import '../../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

Future<StructWithZeroFieldTwinRustAsync> funcStructWithZeroFieldTwinRustAsync(
        {required StructWithZeroFieldTwinRustAsync arg, dynamic hint}) =>
    RustLib.instance.api
        .funcStructWithZeroFieldTwinRustAsync(arg: arg, hint: hint);

Future<StructWithOneFieldTwinRustAsync> funcStructWithOneFieldTwinRustAsync(
        {required StructWithOneFieldTwinRustAsync arg, dynamic hint}) =>
    RustLib.instance.api
        .funcStructWithOneFieldTwinRustAsync(arg: arg, hint: hint);

Future<StructWithTwoFieldTwinRustAsync> funcStructWithTwoFieldTwinRustAsync(
        {required StructWithTwoFieldTwinRustAsync arg, dynamic hint}) =>
    RustLib.instance.api
        .funcStructWithTwoFieldTwinRustAsync(arg: arg, hint: hint);

Future<TupleStructWithOneFieldTwinRustAsync>
    funcTupleStructWithOneFieldTwinRustAsync(
            {required TupleStructWithOneFieldTwinRustAsync arg,
            dynamic hint}) =>
        RustLib.instance.api
            .funcTupleStructWithOneFieldTwinRustAsync(arg: arg, hint: hint);

Future<TupleStructWithTwoFieldTwinRustAsync>
    funcTupleStructWithTwoFieldTwinRustAsync(
            {required TupleStructWithTwoFieldTwinRustAsync arg,
            dynamic hint}) =>
        RustLib.instance.api
            .funcTupleStructWithTwoFieldTwinRustAsync(arg: arg, hint: hint);

class StructWithOneFieldTwinRustAsync {
  final int a;

  const StructWithOneFieldTwinRustAsync({
    required this.a,
  });

  @override
  int get hashCode => a.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StructWithOneFieldTwinRustAsync &&
          runtimeType == other.runtimeType &&
          a == other.a;
}

class StructWithTwoFieldTwinRustAsync {
  final int a;
  final int b;

  const StructWithTwoFieldTwinRustAsync({
    required this.a,
    required this.b,
  });

  @override
  int get hashCode => a.hashCode ^ b.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StructWithTwoFieldTwinRustAsync &&
          runtimeType == other.runtimeType &&
          a == other.a &&
          b == other.b;
}

class StructWithZeroFieldTwinRustAsync {
  const StructWithZeroFieldTwinRustAsync();

  @override
  int get hashCode => 0;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StructWithZeroFieldTwinRustAsync &&
          runtimeType == other.runtimeType;
}

class TupleStructWithOneFieldTwinRustAsync {
  final int field0;

  const TupleStructWithOneFieldTwinRustAsync({
    required this.field0,
  });

  @override
  int get hashCode => field0.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TupleStructWithOneFieldTwinRustAsync &&
          runtimeType == other.runtimeType &&
          field0 == other.field0;
}

class TupleStructWithTwoFieldTwinRustAsync {
  final int field0;
  final int field1;

  const TupleStructWithTwoFieldTwinRustAsync({
    required this.field0,
    required this.field1,
  });

  @override
  int get hashCode => field0.hashCode ^ field1.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TupleStructWithTwoFieldTwinRustAsync &&
          runtimeType == other.runtimeType &&
          field0 == other.field0 &&
          field1 == other.field1;
}
