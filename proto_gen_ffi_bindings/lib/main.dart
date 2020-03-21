import 'dart:ffi';
import 'package:ffi/ffi.dart';

final dylib = DynamicLibrary.open('/usr/lib/llvm-9/lib/libclang.so.1');

void main(List<String> arguments) {

  print(dylib);

}
