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
  int a,
  int b,
);
typedef _sum_Dart = int Function(
  int a,
  int b,
);
