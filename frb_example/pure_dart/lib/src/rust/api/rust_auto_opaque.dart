// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 1.82.4.

// ignore_for_file: invalid_use_of_internal_member, unused_import

import '../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

Future<NonCloneSimpleTwinNormal> rustAutoOpaqueReturnOwn({dynamic hint}) =>
    RustLib.instance.api.rustAutoOpaqueReturnOwn(hint: hint);

// Rust type: flutter_rust_bridge::RustOpaque<NonCloneSimpleTwinNormal>
@sealed
class NonCloneSimpleTwinNormal extends RustOpaque {
  NonCloneSimpleTwinNormal.fromWire(dynamic wire)
      : super.fromWire(wire, _kStaticData);

  static final _kStaticData = RustArcStaticData(
    rustArcIncrementStrongCount: RustLib
        .instance.api.rust_arc_increment_strong_count_NonCloneSimpleTwinNormal,
    rustArcDecrementStrongCount: RustLib
        .instance.api.rust_arc_decrement_strong_count_NonCloneSimpleTwinNormal,
    rustArcDecrementStrongCountPtr: RustLib.instance.api
        .rust_arc_decrement_strong_count_NonCloneSimpleTwinNormalPtr,
  );
}
