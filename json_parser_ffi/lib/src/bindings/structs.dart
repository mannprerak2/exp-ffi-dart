import 'dart:ffi';
import 'package:ffi/ffi.dart';

class CJson extends Struct {
  Pointer<CJson> next, prev, child;

  @Int32()
  int type;

  Pointer<Utf8> valueString;
  @Int32()
  int valueInt;
  @Double()
  double valuedouble;

  Pointer<Utf8> string;

  CJson._();
}
