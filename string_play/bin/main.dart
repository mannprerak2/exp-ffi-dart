import 'dart:ffi' as ffi;
import 'dart:io' show File, Platform;
import 'package:ffi/ffi.dart';
import 'package:yaml/yaml.dart';

typedef strlen_c_func = ffi.Int32 Function(ffi.Pointer<Utf8> a);

typedef StrLen = int Function(ffi.Pointer<Utf8> a);

typedef strchr_c_func = ffi.Pointer<Utf8> Function(
    ffi.Pointer<Utf8> a, ffi.Int8 c);

typedef StrChr = ffi.Pointer<Utf8> Function(ffi.Pointer<Utf8> a, int character);

void main(List<String> arguments) {
// Open the dynamic library
  // since string.h is always available in library we are using
  // the same dynamic library as in simple-blurhash-generator
  var path = getPath();
  print(path);
  // final dylib = ffi.DynamicLibrary.open(path);
  // final strlen = dylib
  //     .lookup<ffi.NativeFunction<strlen_c_func>>('strlen')
  //     .asFunction<StrLen>();
  // final strchr = dylib
  //     .lookup<ffi.NativeFunction<strchr_c_func>>('strchr')
  //     .asFunction<StrChr>();
  // var s = 'Hello World';
  // print("Here's a String: $s");

  // var ptr = Utf8.toUtf8(s);

  // print("Let's get the pointer the first occurance of 'W'");
  // var partptr = strchr(ptr, 'W'.codeUnitAt(0));
  // print('Position of W is: ${strlen(ptr) - strlen(partptr)}');
  // print('and print the string from there');
  // print(Utf8.fromUtf8(partptr));
}

String getPath() {
  var yaml = loadYaml(File('pubspec.yaml').readAsStringSync());

  var pathObj = yaml['my_configs']['path'];
  var path = pathObj['default'];
  if (Platform.isMacOS) path = './strings_library/libstringplay.dylib';
  if (Platform.isWindows) path = r'strings_library\Debug\stringplay.dll';
  return path;
}
