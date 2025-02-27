// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.4.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../../auxiliary/sample_types.dart';
import '../../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

Future<int> handleTypeAliasIdTwinRustAsyncSse(
        {required int input, dynamic hint}) =>
    RustLib.instance.api
        .handleTypeAliasIdTwinRustAsyncSse(input: input, hint: hint);

Future<int> handleTypeNestAliasIdTwinRustAsyncSse(
        {required int input, dynamic hint}) =>
    RustLib.instance.api
        .handleTypeNestAliasIdTwinRustAsyncSse(input: input, hint: hint);

Future<TestModelTwinRustAsyncSse> handleTypeAliasModelTwinRustAsyncSse(
        {required int input, dynamic hint}) =>
    RustLib.instance.api
        .handleTypeAliasModelTwinRustAsyncSse(input: input, hint: hint);

class TestModelTwinRustAsyncSse {
  final int id;
  final String name;
  final MyEnum aliasEnum;
  final MyStruct aliasStruct;

  const TestModelTwinRustAsyncSse({
    required this.id,
    required this.name,
    required this.aliasEnum,
    required this.aliasStruct,
  });

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ aliasEnum.hashCode ^ aliasStruct.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TestModelTwinRustAsyncSse &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          aliasEnum == other.aliasEnum &&
          aliasStruct == other.aliasStruct;
}
