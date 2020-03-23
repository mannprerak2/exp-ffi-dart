// AUTOMATICALLY GENERATED. DO NOT EDIT.

import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart' as ffi;

/// Dynamic library
final ffi.DynamicLibrary _dynamicLibrary = ffi.DynamicLibrary.open(
  './wrapped_libclang_library/libwrapped_clang.so',
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
  ffi.Pointer<ffi.Void> cxtranslationunit,
) {
  return _clang_getNumDiagnostics(cxtranslationunit);
}

final _clang_getNumDiagnostics_Dart _clang_getNumDiagnostics = _dynamicLibrary
    .lookupFunction<_clang_getNumDiagnostics_C, _clang_getNumDiagnostics_Dart>(
  'clang_getNumDiagnostics',
);
typedef _clang_getNumDiagnostics_C = ffi.Uint32 Function(
  ffi.Pointer<ffi.Void> cxtranslationunit,
);
typedef _clang_getNumDiagnostics_Dart = int Function(
  ffi.Pointer<ffi.Void> cxtranslationunit,
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

/// C function `clang_getCursorKind`.
int clang_getCursorKind(
  ffi.Pointer<CXCursor> cursor,
) {
  return _clang_getCursorKind(cursor);
}

final _clang_getCursorKind_Dart _clang_getCursorKind = _dynamicLibrary
    .lookupFunction<_clang_getCursorKind_C, _clang_getCursorKind_Dart>(
  'clang_getCursorKind',
);
typedef _clang_getCursorKind_C = ffi.Int32 Function(
  ffi.Pointer<CXCursor> cursor,
);
typedef _clang_getCursorKind_Dart = int Function(
  ffi.Pointer<CXCursor> cursor,
);

/// C function `clang_getCursorSpelling`.
ffi.Pointer<CXString> clang_getCursorSpelling(
  ffi.Pointer<CXCursor> cursor,
) {
  return _clang_getCursorSpelling(cursor);
}

final _clang_getCursorSpelling_Dart _clang_getCursorSpelling = _dynamicLibrary
    .lookupFunction<_clang_getCursorSpelling_C, _clang_getCursorSpelling_Dart>(
  'clang_getCursorSpelling',
);
typedef _clang_getCursorSpelling_C = ffi.Pointer<CXString> Function(
  ffi.Pointer<CXCursor> cursor,
);
typedef _clang_getCursorSpelling_Dart = ffi.Pointer<CXString> Function(
  ffi.Pointer<CXCursor> cursor,
);

/// C function `clang_getTranslationUnitCursor`.
ffi.Pointer clang_getTranslationUnitCursor(
  ffi.Pointer<ffi.Void> cxtranslation_unit,
) {
  return _clang_getTranslationUnitCursor(cxtranslation_unit);
}

final _clang_getTranslationUnitCursor_Dart _clang_getTranslationUnitCursor =
    _dynamicLibrary.lookupFunction<_clang_getTranslationUnitCursor_C,
        _clang_getTranslationUnitCursor_Dart>(
  'clang_getTranslationUnitCursor',
);
typedef _clang_getTranslationUnitCursor_C = ffi.Pointer Function(
  ffi.Pointer<ffi.Void> cxtranslation_unit,
);
typedef _clang_getTranslationUnitCursor_Dart = ffi.Pointer Function(
  ffi.Pointer<ffi.Void> cxtranslation_unit,
);

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

/// C struct `CXCursor`.
class CXCursor extends ffi.Struct {
  static ffi.Pointer<CXCursor> allocate() {
    return ffi.allocate<CXCursor>();
  }
}
