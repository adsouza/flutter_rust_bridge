// ignore_for_file: invalid_use_of_internal_member, unused_import

import '../../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

Future<RawStringItemStructTwinRustAsync> testRawStringItemStructTwinRustAsync(
        {dynamic hint}) =>
    RustLib.instance.api.testRawStringItemStructTwinRustAsync(hint: hint);

Future<MoreThanJustOneRawStringStructTwinRustAsync>
    testMoreThanJustOneRawStringStructTwinRustAsync({dynamic hint}) =>
        RustLib.instance.api
            .testMoreThanJustOneRawStringStructTwinRustAsync(hint: hint);

class MoreThanJustOneRawStringStructTwinRustAsync {
  final String regular;
  final String type;
  final bool async;
  final String another;

  const MoreThanJustOneRawStringStructTwinRustAsync({
    required this.regular,
    required this.type,
    required this.async,
    required this.another,
  });

  @override
  int get hashCode =>
      regular.hashCode ^ type.hashCode ^ async.hashCode ^ another.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoreThanJustOneRawStringStructTwinRustAsync &&
          runtimeType == other.runtimeType &&
          regular == other.regular &&
          type == other.type &&
          async == other.async &&
          another == other.another;
}

class RawStringItemStructTwinRustAsync {
  final String type;

  const RawStringItemStructTwinRustAsync({
    required this.type,
  });

  @override
  int get hashCode => type.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RawStringItemStructTwinRustAsync &&
          runtimeType == other.runtimeType &&
          type == other.type;
}
