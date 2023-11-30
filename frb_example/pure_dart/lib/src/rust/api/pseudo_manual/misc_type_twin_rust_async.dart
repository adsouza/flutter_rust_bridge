// ignore_for_file: invalid_use_of_internal_member, unused_import

import '../../auxiliary/sample_types.dart';
import '../../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

Future<String> funcStringTwinRustAsync({required String arg, dynamic hint}) =>
    RustLib.instance.api.funcStringTwinRustAsync(arg: arg, hint: hint);

Future<void> funcReturnUnitTwinRustAsync({dynamic hint}) =>
    RustLib.instance.api.funcReturnUnitTwinRustAsync(hint: hint);

Future<List<MySize>> handleListOfStructTwinRustAsync(
        {required List<MySize> l, dynamic hint}) =>
    RustLib.instance.api.handleListOfStructTwinRustAsync(l: l, hint: hint);

Future<List<String>> handleStringListTwinRustAsync(
        {required List<String> names, dynamic hint}) =>
    RustLib.instance.api
        .handleStringListTwinRustAsync(names: names, hint: hint);

Future<EmptyTwinRustAsync> emptyStructTwinRustAsync(
        {required EmptyTwinRustAsync empty, dynamic hint}) =>
    RustLib.instance.api.emptyStructTwinRustAsync(empty: empty, hint: hint);

class EmptyTwinRustAsync {
  const EmptyTwinRustAsync();

  @override
  int get hashCode => 0;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmptyTwinRustAsync && runtimeType == other.runtimeType;
}
