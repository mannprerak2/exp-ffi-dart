// AUTOMATICALLY GENERATED. DO NOT EDIT.

import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart' as ffi;

/// Dynamic library
final ffi.DynamicLibrary _dynamicLibrary = ffi.DynamicLibrary.open(
  '/usr/lib/llvm-9/lib/libclang.so.1',
);

/// C function `clang_createIndex`.
ffi.Pointer<ffi.Void> clang_createIndex(
  int excludeDeclarationsFromPCH,
  int displayDiagnostics,
) {
  return _clang_createIndex(excludeDeclarationsFromPCH, displayDiagnostics);
}

final _clang_createIndex_Dart _clang_createIndex = _dynamicLibrary
    .lookupFunction<_clang_createIndex_C, _clang_createIndex_Dart>(
  'clang_createIndex',
);
typedef _clang_createIndex_C = ffi.Pointer<ffi.Void> Function(
  ffi.Int32 excludeDeclarationsFromPCH,
  ffi.Int32 displayDiagnostics,
);
typedef _clang_createIndex_Dart = ffi.Pointer<ffi.Void> Function(
  int excludeDeclarationsFromPCH,
  int displayDiagnostics,
);

/// C function `clang_disposeIndex`.
void clang_disposeIndex(
  ffi.Pointer<ffi.Void> index,
) {
  _clang_disposeIndex(index);
}

final _clang_disposeIndex_Dart _clang_disposeIndex = _dynamicLibrary
    .lookupFunction<_clang_disposeIndex_C, _clang_disposeIndex_Dart>(
  'clang_disposeIndex',
);
typedef _clang_disposeIndex_C = ffi.Void Function(
  ffi.Pointer<ffi.Void> index,
);
typedef _clang_disposeIndex_Dart = void Function(
  ffi.Pointer<ffi.Void> index,
);

/// C function `clang_parseTranslationUnit`.
ffi.Pointer<ffi.Void> clang_parseTranslationUnit(
  ffi.Pointer<ffi.Void> CIdx,
  ffi.Pointer<ffi.Utf8> source_filename,
  ffi.Pointer<ffi.Pointer<ffi.Utf8>> cmd_line_args,
  int num_cmd_line_args,
  ffi.Pointer<CXUnsavedFile> unsaved_files,
  int num_unsaved_files,
  int options,
) {
  return _clang_parseTranslationUnit(CIdx, source_filename, cmd_line_args,
      num_cmd_line_args, unsaved_files, num_unsaved_files, options);
}

final _clang_parseTranslationUnit_Dart _clang_parseTranslationUnit =
    _dynamicLibrary.lookupFunction<_clang_parseTranslationUnit_C,
        _clang_parseTranslationUnit_Dart>(
  'clang_parseTranslationUnit',
);
typedef _clang_parseTranslationUnit_C = ffi.Pointer<ffi.Void> Function(
  ffi.Pointer<ffi.Void> CIdx,
  ffi.Pointer<ffi.Utf8> source_filename,
  ffi.Pointer<ffi.Pointer<ffi.Utf8>> cmd_line_args,
  ffi.Int32 num_cmd_line_args,
  ffi.Pointer<CXUnsavedFile> unsaved_files,
  ffi.Uint32 num_unsaved_files,
  ffi.Uint32 options,
);
typedef _clang_parseTranslationUnit_Dart = ffi.Pointer<ffi.Void> Function(
  ffi.Pointer<ffi.Void> CIdx,
  ffi.Pointer<ffi.Utf8> source_filename,
  ffi.Pointer<ffi.Pointer<ffi.Utf8>> cmd_line_args,
  int num_cmd_line_args,
  ffi.Pointer<CXUnsavedFile> unsaved_files,
  int num_unsaved_files,
  int options,
);

/// C function `clang_disposeTranslationUnit`.
void clang_disposeTranslationUnit(
  ffi.Pointer<ffi.Void> cxtranslation_unit,
) {
  _clang_disposeTranslationUnit(cxtranslation_unit);
}

final _clang_disposeTranslationUnit_Dart _clang_disposeTranslationUnit =
    _dynamicLibrary.lookupFunction<_clang_disposeTranslationUnit_C,
        _clang_disposeTranslationUnit_Dart>(
  'clang_disposeTranslationUnit',
);
typedef _clang_disposeTranslationUnit_C = ffi.Void Function(
  ffi.Pointer<ffi.Void> cxtranslation_unit,
);
typedef _clang_disposeTranslationUnit_Dart = void Function(
  ffi.Pointer<ffi.Void> cxtranslation_unit,
);

/// C function `clang_getNumDiagnostics`.
int clang_getNumDiagnostics(
  ffi.Pointer<ffi.Void> unit,
) {
  return _clang_getNumDiagnostics(unit);
}

final _clang_getNumDiagnostics_Dart _clang_getNumDiagnostics = _dynamicLibrary
    .lookupFunction<_clang_getNumDiagnostics_C, _clang_getNumDiagnostics_Dart>(
  'clang_getNumDiagnostics',
);
typedef _clang_getNumDiagnostics_C = ffi.Uint32 Function(
  ffi.Pointer<ffi.Void> unit,
);
typedef _clang_getNumDiagnostics_Dart = int Function(
  ffi.Pointer<ffi.Void> unit,
);

/// C function `clang_getDiagnostic`.
ffi.Pointer<ffi.Void> clang_getDiagnostic(
  ffi.Pointer<ffi.Void> cxTranslationUnit,
  int position,
) {
  return _clang_getDiagnostic(cxTranslationUnit, position);
}

final _clang_getDiagnostic_Dart _clang_getDiagnostic = _dynamicLibrary
    .lookupFunction<_clang_getDiagnostic_C, _clang_getDiagnostic_Dart>(
  'clang_getDiagnostic',
);
typedef _clang_getDiagnostic_C = ffi.Pointer<ffi.Void> Function(
  ffi.Pointer<ffi.Void> cxTranslationUnit,
  ffi.Int32 position,
);
typedef _clang_getDiagnostic_Dart = ffi.Pointer<ffi.Void> Function(
  ffi.Pointer<ffi.Void> cxTranslationUnit,
  int position,
);

/// C function `clang_formatDiagnostic`.
ffi.Pointer<CXString> clang_formatDiagnostic(
  ffi.Pointer<ffi.Void> diagnostic,
  int diagnosticOptions,
) {
  return _clang_formatDiagnostic(diagnostic, diagnosticOptions);
}

final _clang_formatDiagnostic_Dart _clang_formatDiagnostic = _dynamicLibrary
    .lookupFunction<_clang_formatDiagnostic_C, _clang_formatDiagnostic_Dart>(
  'clang_formatDiagnostic',
);
typedef _clang_formatDiagnostic_C = ffi.Pointer<CXString> Function(
  ffi.Pointer<ffi.Void> diagnostic,
  ffi.Uint32 diagnosticOptions,
);
typedef _clang_formatDiagnostic_Dart = ffi.Pointer<CXString> Function(
  ffi.Pointer<ffi.Void> diagnostic,
  int diagnosticOptions,
);

/// C function `clang_defaultDiagnosticDisplayOptions`.
int clang_defaultDiagnosticDisplayOptions() {
  return _clang_defaultDiagnosticDisplayOptions();
}

final _clang_defaultDiagnosticDisplayOptions_Dart
    _clang_defaultDiagnosticDisplayOptions = _dynamicLibrary.lookupFunction<
        _clang_defaultDiagnosticDisplayOptions_C,
        _clang_defaultDiagnosticDisplayOptions_Dart>(
  'clang_defaultDiagnosticDisplayOptions',
);
typedef _clang_defaultDiagnosticDisplayOptions_C = ffi.Uint32 Function();
typedef _clang_defaultDiagnosticDisplayOptions_Dart = int Function();

/// C function `clang_getCString`.
ffi.Pointer<ffi.Utf8> clang_getCString(
  ffi.Pointer<CXString> cxstringPtr,
) {
  return _clang_getCString(cxstringPtr);
}

final _clang_getCString_Dart _clang_getCString =
    _dynamicLibrary.lookupFunction<_clang_getCString_C, _clang_getCString_Dart>(
  'clang_getCString',
);
typedef _clang_getCString_C = ffi.Pointer<ffi.Utf8> Function(
  ffi.Pointer<CXString> cxstringPtr,
);
typedef _clang_getCString_Dart = ffi.Pointer<ffi.Utf8> Function(
  ffi.Pointer<CXString> cxstringPtr,
);

/// C struct `CXTranslationUnitImpl`.
class CXTranslationUnitImpl extends ffi.Struct {
  static ffi.Pointer<CXTranslationUnitImpl> allocate() {
    return ffi.allocate<CXTranslationUnitImpl>();
  }
}

/// C struct `CXUnsavedFile`.
class CXUnsavedFile extends ffi.Struct {
  static ffi.Pointer<CXUnsavedFile> allocate() {
    return ffi.allocate<CXUnsavedFile>();
  }
}

/// C struct `CXString`.
class CXString extends ffi.Struct {
  static ffi.Pointer<CXString> allocate() {
    return ffi.allocate<CXString>();
  }
}
