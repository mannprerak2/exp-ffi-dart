// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:ffi' as ffi;
import 'dart:io' show Platform;

// FFI signature of the hello_world C function
typedef printData_func = ffi.Void Function(ffi.Pointer<Data>);
typedef PrintData = void Function(ffi.Pointer<Data>);

typedef create_struct_func = ffi.Pointer<Data> Function(ffi.Int32);
typedef CreateStruct = ffi.Pointer<Data> Function(int);
// Dart type definition for calling the C foreign function

class Data extends ffi.Struct {}

void main() {
  // Open the dynamic library
  var path = "./hello_library/libhello.so";
  if (Platform.isMacOS) path = './hello_library/libhello.dylib';
  if (Platform.isWindows) path = r'hello_library\Debug\hello.dll';
  final dylib = ffi.DynamicLibrary.open(path);
  // Look up the C function 'hello_world'
  final PrintData hello = dylib
      .lookup<ffi.NativeFunction<printData_func>>('printData')
      .asFunction();
  final CreateStruct createStruct =
      dylib.lookupFunction<create_struct_func, CreateStruct>('createData');
  // Call the function

  var ptr = createStruct(11);
  hello(ptr);
}
