// ignore_for_file: invalid_use_of_internal_member, unused_import

import '../../auxiliary/new_module_system/sub_module.dart';
import '../../auxiliary/old_module_system/sub_module.dart';
import '../../auxiliary/sample_types.dart';
import '../../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

Future<bool> useImportedStructTwinRustAsync(
        {required MyStruct myStruct, dynamic hint}) =>
    RustLib.instance.api
        .useImportedStructTwinRustAsync(myStruct: myStruct, hint: hint);

Future<bool> useImportedEnumTwinRustAsync(
        {required MyEnum myEnum, dynamic hint}) =>
    RustLib.instance.api
        .useImportedEnumTwinRustAsync(myEnum: myEnum, hint: hint);

Future<OldSimpleStruct> callOldModuleSystemTwinRustAsync({dynamic hint}) =>
    RustLib.instance.api.callOldModuleSystemTwinRustAsync(hint: hint);

Future<NewSimpleStruct> callNewModuleSystemTwinRustAsync({dynamic hint}) =>
    RustLib.instance.api.callNewModuleSystemTwinRustAsync(hint: hint);
