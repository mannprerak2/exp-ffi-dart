A fast sphageti code prototype for generating ffi binding from C headers using LibClang and dart ffi

ffi_tool is used to create dart bindings for clang (see the tool folder)

## Demo Run 
#### see [test.h](./test.h) and [test_generated.dart](./test_generated.dart) for complete example

for a function declaration like this
```C
float *divide(int a, int b);
```

This is the generated bindings
```dart
/// C function `divide`.
ffi.Pointer<ffi.Float> divide(
  int a,
  int b,
) {
  return _divide(a, b);
}

final _divide_Dart _divide =
    _dynamicLibrary.lookupFunction<_divide_C, _divide_Dart>(
  'divide',
);
typedef _divide_C = ffi.Pointer<ffi.Float> Function(
  ffi.Int32 a,
  ffi.Int32 b,
);
typedef _divide_Dart = ffi.Pointer<ffi.Float> Function(
  int a,
  int b,
);

```

## Challenges

1. Many functions return structs by value. So generating bindings isn't possible for them
   E.g `clang_parseTranslationUnit`, However replacing the return type with Pointer in some
   functions seems to make them work.
   However, Some functions cannot be called like this E.g `clang_getTranslationUnitCursor`.
   **Solution** -
   Wrapper functions are required

2. Building the dynamic library-
   Couldn't link clang using CMake, so currently I am building the dynamic library using clang tool with the following command
   ```bash
   clang -lclang -shared -fpic wrapped_libclang_library/wrapper.c -o wrapped_libclang_library/libwrapped_clang.so
   ```
