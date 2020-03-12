import 'dart:ffi' as ffi;
import 'dart:io' show Platform;
import 'package:ffi/ffi.dart';

// FFI signature of the C function
typedef blur_hash_c_func = ffi.Pointer<Utf8> Function(
    ffi.Int32 xComponents, ffi.Int32 yComponents, ffi.Pointer<Utf8> filename);
// Dart type definition for calling the C foreign function
typedef BlurHash = ffi.Pointer<Utf8> Function(
    int xComp, int yComp, ffi.Pointer<Utf8> filename);

void main(List<String> arguments) {
  if (arguments.length != 1) {
    print('Wrong Usage');
    printHelp();
  } else {
    if (arguments[0] == '--help' || arguments[0] == '-h') {
      printHelp();
    } else {
      // Open the dynamic library
      var path = './blurhash_library/libblurhash.so';
      if (Platform.isMacOS) path = './blurhash_library/libblurhash.dylib';
      if (Platform.isWindows) path = r'blurhash_library\Debug\blurhash.dll';
      final dylib = ffi.DynamicLibrary.open(path);
      final blurHash = dylib
          .lookup<ffi.NativeFunction<blur_hash_c_func>>('blurHashForFile')
          .asFunction<BlurHash>();
      // could have used helper function as well
      // (can replace above line with below)
      // final blurHash = dylib.lookupFunction<blur_hash_c_func,BlurHash>('blurHashForFile');
      
      // Call the function
      int xComp = 4;
      int yComp = 3;
      var hashResult =
          Utf8.fromUtf8(blurHash(xComp, yComp, Utf8.toUtf8(arguments[0])));
      print(hashResult);
    }
  }
}

void printHelp() {
  print('Simple program to generate blurhash for an image');
  print('Usage:');
  print('\targuments - [file-path]');
}
