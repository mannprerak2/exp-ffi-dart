// AUTOMATICALLY GENERATED. DO NOT EDIT.

import 'dart:ffi' as ffi;

/// Dynamic library
final ffi.DynamicLibrary _dynamicLibrary = ffi.DynamicLibrary.open(
  'path/to/dynamic/library',
);

/// C function `sum`.
int sum(
  int a,
  int b,
) {
  return _sum(a, b);
}

final _sum_Dart _sum = _dynamicLibrary.lookupFunction<_sum_C, _sum_Dart>(
  'sum',
);
typedef _sum_C = ffi.Int32 Function(
  ffi.Int32 a,
  ffi.Int32 b,
);
typedef _sum_Dart = int Function(
  int a,
  int b,
);

/// C function `subtract`.
int subtract(
  ffi.Pointer<ffi.Int32> a,
  int b,
) {
  return _subtract(a, b);
}

final _subtract_Dart _subtract =
    _dynamicLibrary.lookupFunction<_subtract_C, _subtract_Dart>(
  'subtract',
);
typedef _subtract_C = ffi.Int32 Function(
  ffi.Pointer<ffi.Int32> a,
  ffi.Int32 b,
);
typedef _subtract_Dart = int Function(
  ffi.Pointer<ffi.Int32> a,
  int b,
);

/// C function `multiply`.
ffi.Pointer<ffi.Int32> multiply(
  int a,
  int b,
) {
  return _multiply(a, b);
}

final _multiply_Dart _multiply =
    _dynamicLibrary.lookupFunction<_multiply_C, _multiply_Dart>(
  'multiply',
);
typedef _multiply_C = ffi.Pointer<ffi.Int32> Function(
  ffi.Int32 a,
  ffi.Int32 b,
);
typedef _multiply_Dart = ffi.Pointer<ffi.Int32> Function(
  int a,
  int b,
);

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

/// C function `dividePercision`.
ffi.Pointer<ffi.Double> dividePercision(
  ffi.Pointer<ffi.Float> a,
  ffi.Pointer<ffi.Float> b,
) {
  return _dividePercision(a, b);
}

final _dividePercision_Dart _dividePercision =
    _dynamicLibrary.lookupFunction<_dividePercision_C, _dividePercision_Dart>(
  'dividePercision',
);
typedef _dividePercision_C = ffi.Pointer<ffi.Double> Function(
  ffi.Pointer<ffi.Float> a,
  ffi.Pointer<ffi.Float> b,
);
typedef _dividePercision_Dart = ffi.Pointer<ffi.Double> Function(
  ffi.Pointer<ffi.Float> a,
  ffi.Pointer<ffi.Float> b,
);
