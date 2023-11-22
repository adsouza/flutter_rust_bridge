// NOTE: This file is mimicking how a human developer writes tests,
// and is auto-generated by frb_internal
// Please do not modify manually, but modify the origin and re-run frb_internal generator

import 'package:frb_example_pure_dart/src/rust/api/pseudo_manual/primitive.dart';
import 'package:frb_example_pure_dart/src/rust/frb_generated.dart';
import 'package:test/test.dart';

Future<void> main() async {
  await RustLib.init();

  group('primitive', () {
    test('type=i8 arg=0', () async {
      expect(await examplePrimitiveTypeI8TwinNormal(arg: 0), 0);
    });
    test('type=i8 arg=-128', () async {
      expect(await examplePrimitiveTypeI8TwinNormal(arg: -128), -128);
    });
    test('type=i8 arg=127', () async {
      expect(await examplePrimitiveTypeI8TwinNormal(arg: 127), 127);
    });
    test('type=i16 arg=0', () async {
      expect(await examplePrimitiveTypeI16TwinNormal(arg: 0), 0);
    });
    test('type=i16 arg=-32768', () async {
      expect(await examplePrimitiveTypeI16TwinNormal(arg: -32768), -32768);
    });
    test('type=i16 arg=32767', () async {
      expect(await examplePrimitiveTypeI16TwinNormal(arg: 32767), 32767);
    });
    test('type=i32 arg=0', () async {
      expect(await examplePrimitiveTypeI32TwinNormal(arg: 0), 0);
    });
    test('type=i32 arg=-2147483648', () async {
      expect(await examplePrimitiveTypeI32TwinNormal(arg: -2147483648),
          -2147483648);
    });
    test('type=i32 arg=2147483647', () async {
      expect(
          await examplePrimitiveTypeI32TwinNormal(arg: 2147483647), 2147483647);
    });
    test('type=i64 arg=BigInt.parse("0")', () async {
      expect(await examplePrimitiveTypeI64TwinNormal(arg: BigInt.parse("0")),
          BigInt.parse("0"));
    });
    test('type=i64 arg=BigInt.parse("-9223372036854775808")', () async {
      expect(
          await examplePrimitiveTypeI64TwinNormal(
              arg: BigInt.parse("-9223372036854775808")),
          BigInt.parse("-9223372036854775808"));
    });
    test('type=i64 arg=BigInt.parse("9223372036854775807")', () async {
      expect(
          await examplePrimitiveTypeI64TwinNormal(
              arg: BigInt.parse("9223372036854775807")),
          BigInt.parse("9223372036854775807"));
    });
    test('type=u8 arg=0', () async {
      expect(await examplePrimitiveTypeU8TwinNormal(arg: 0), 0);
    });
    test('type=u8 arg=255', () async {
      expect(await examplePrimitiveTypeU8TwinNormal(arg: 255), 255);
    });
    test('type=u16 arg=0', () async {
      expect(await examplePrimitiveTypeU16TwinNormal(arg: 0), 0);
    });
    test('type=u16 arg=65535', () async {
      expect(await examplePrimitiveTypeU16TwinNormal(arg: 65535), 65535);
    });
    test('type=u32 arg=0', () async {
      expect(await examplePrimitiveTypeU32TwinNormal(arg: 0), 0);
    });
    test('type=u32 arg=4294967295', () async {
      expect(
          await examplePrimitiveTypeU32TwinNormal(arg: 4294967295), 4294967295);
    });
    test('type=u64 arg=BigInt.parse("0")', () async {
      expect(await examplePrimitiveTypeU64TwinNormal(arg: BigInt.parse("0")),
          BigInt.parse("0"));
    });
    test('type=u64 arg=BigInt.parse("9223372036854775807")', () async {
      expect(
          await examplePrimitiveTypeU64TwinNormal(
              arg: BigInt.parse("9223372036854775807")),
          BigInt.parse("9223372036854775807"));
    });
    test('type=f32 arg=0', () async {
      expect(await examplePrimitiveTypeF32TwinNormal(arg: 0), 0);
    });
    test('type=f32 arg=-42.5', () async {
      expect(await examplePrimitiveTypeF32TwinNormal(arg: -42.5), -42.5);
    });
    test('type=f32 arg=123456', () async {
      expect(await examplePrimitiveTypeF32TwinNormal(arg: 123456), 123456);
    });
    test('type=f64 arg=0', () async {
      expect(await examplePrimitiveTypeF64TwinNormal(arg: 0), 0);
    });
    test('type=f64 arg=-42.5', () async {
      expect(await examplePrimitiveTypeF64TwinNormal(arg: -42.5), -42.5);
    });
    test('type=f64 arg=123456', () async {
      expect(await examplePrimitiveTypeF64TwinNormal(arg: 123456), 123456);
    });
    test('type=bool arg=false', () async {
      expect(await examplePrimitiveTypeBoolTwinNormal(arg: false), false);
    });
    test('type=bool arg=true', () async {
      expect(await examplePrimitiveTypeBoolTwinNormal(arg: true), true);
    });
  });
}
