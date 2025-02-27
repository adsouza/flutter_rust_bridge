// NOTE: This file is mimicking how a human developer writes tests,
// and is auto-generated from `dart_fn_test.dart` by frb_internal
// Please do not modify manually, but modify the origin and re-run frb_internal generator

// FRB_INTERNAL_GENERATOR: {"forbiddenDuplicatorModes": ["sync", "syncSse"]}

import 'package:frb_example_pure_dart/src/rust/api/pseudo_manual/dart_fn_twin_rust_async_sse.dart';
import 'package:frb_example_pure_dart/src/rust/frb_generated.dart';
import 'package:test/test.dart';

Future<void> main({bool skipRustLibInit = false}) async {
  if (!skipRustLibInit) await RustLib.init();

  test('rustCallDartSimpleTwinRustAsyncSse', () async {
    var callbackCallCount = 0;
    await rustCallDartSimpleTwinRustAsyncSse(
        callback: () => callbackCallCount++);
    expect(callbackCallCount, 1);
  });

  test('rustCallDartOneArgTwinRustAsyncSse', () async {
    final callbackCalls = <String>[];
    await rustCallDartOneArgTwinRustAsyncSse(
        callback: (arg) => callbackCalls.add(arg));
    expect(callbackCalls, ['a']);
  });

  test('rustCallDartTwoArgsTwinRustAsyncSse', () async {
    final callbackCalls =
        <(String, DemoStructForRustCallDartTwinRustAsyncSse)>[];
    await rustCallDartTwoArgsTwinRustAsyncSse(
        callback: (a, b) => callbackCalls.add((a, b)));
    expect(callbackCalls,
        [('a', DemoStructForRustCallDartTwinRustAsyncSse(name: 'b'))]);
  });

  test('rustCallDartReturnTwinRustAsyncSse', () async {
    var callCount = 0;
    await rustCallDartReturnTwinRustAsyncSse(callback: () {
      callCount++;
      return 'a';
    });
    expect(callCount, 1);
  });

  test('rustCallDartLoopbackTwinRustAsyncSse', () async {
    var callCount = 0;
    await rustCallDartLoopbackTwinRustAsyncSse(callback: (arg) {
      callCount++;
      return arg;
    });
    expect(callCount, 1);
  });

  test('rust closure be asynchronous', () async {
    var callCount = 0;
    await rustCallDartLoopbackTwinRustAsyncSse(callback: (arg) async {
      callCount++;
      return arg;
    });
    expect(callCount, 1);
  });

  test('rustCallDartWithDartOpaqueArgTwinRustAsyncSse', () async {
    final opaque = (String whatever) => 42;
    var callbackCalls = <Object>[];
    await rustCallDartWithDartOpaqueArgTwinRustAsyncSse(
        input: opaque, callback: (arg) => callbackCalls.add(arg));
    expect(callbackCalls, [opaque]);
  });

  test('rustCallDartWithDartOpaqueResultTwinRustAsyncSse', () async {
    final opaque = (String whatever) => 42;
    var callCount = 0;
    final output =
        await rustCallDartWithDartOpaqueResultTwinRustAsyncSse(callback: () {
      callCount++;
      return opaque;
    });
    expect(callCount, 1);
    expect(output, opaque);
  });

  test('rustCallDartMultiTimesTwinRustAsyncSse', () async {
    var callCount = 0;
    await rustCallDartMultiTimesTwinRustAsyncSse(
        callback: () => callCount++, numTimes: 10);
    expect(callCount, 10);
  });
}
