// NOTE: This file is mimicking how a human developer writes tests,
// and is auto-generated from `stream_test.dart` by frb_internal
// Please do not modify manually, but modify the origin and re-run frb_internal generator

// FRB_INTERNAL_GENERATOR: {"forbiddenDuplicatorModes": ["sync", "syncSse"]}

import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'package:frb_example_pure_dart/src/rust/api/pseudo_manual/stream_twin_rust_async_sse.dart';
import 'package:frb_example_pure_dart/src/rust/frb_generated.dart';
import 'package:test/test.dart';

import '../../test_utils.dart';

Future<void> main({bool skipRustLibInit = false}) async {
  if (!skipRustLibInit) await RustLib.init();

  test('dart call funcStreamSinkArgPositionTwinRustAsyncSse', () async {
    // We only care about whether the codegen can understand StreamSink
    // as non-first argument in Rust, thus we do not test the return values.
    funcStreamSinkArgPositionTwinRustAsyncSse(a: 100, b: 200);
  });

  test('call funcStreamReturnErrorTwinRustAsyncSse', () async {
    await expectLater(
      () async {
        await for (final _ in funcStreamReturnErrorTwinRustAsyncSse()) {}
      },
      throwsA(isA<AnyhowException>()
          .having((x) => x.message, 'message', startsWith('deliberate error'))),
    );
  });

  // TODO implement in web
  test('call funcStreamReturnPanicTwinRustAsyncSse', skip: kIsWeb, () async {
    await expectRustPanic(
      () async {
        await for (final _ in funcStreamReturnPanicTwinRustAsyncSse()) {}
      },
      'TwinRustAsyncSse',
      messageOnNative: 'deliberate panic',
    );
  });

  Future<void> testHandleStream(
      Stream<LogTwinRustAsyncSse> Function(
              {dynamic hint, required int key, required int max})
          handleStreamFunction) async {
    final max = 5;
    final key = 8;
    final stream = handleStreamFunction(key: key, max: max);
    var cnt = 0;
    await for (final value in stream) {
      print("output from handle_stream_x's stream: $value");
      expect(value.key, key);
      cnt++;
    }
    expect(cnt, max);
  }

  test('dart call handle_stream_sink_at_1', () {
    testHandleStream(handleStreamSinkAt1TwinRustAsyncSse);
  });

  test('dart call handle_stream_sink_at_2', () {
    testHandleStream(handleStreamSinkAt2TwinRustAsyncSse);
  });

  test('dart call handle_stream_sink_at_3', () {
    testHandleStream(handleStreamSinkAt3TwinRustAsyncSse);
  });
}
