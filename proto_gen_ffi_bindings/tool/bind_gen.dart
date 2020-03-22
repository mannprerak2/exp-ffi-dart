import 'package:ffi_tool/c.dart';
import 'dart:io';

const _voidPointer = '*ffi.Void';
const _charPointer = '*ffi.Utf8';
const _charPointerPointer = '**ffi.Utf8';
void main() {
  // Generates source code and runs 'dartfmt'
  generateFile(File('lib/clang_bindings/generated_bindings.dart'), library);
}

final library = const Library(
  // Where the library is found?
  dynamicLibraryPath: '/usr/lib/llvm-9/lib/libclang.so.1',

  // Optional imports
  importedUris: {},

  /// List of generated functions, structs, and global variables
  elements: <Element>[
    Func(
      name: 'clang_createIndex',
      parameterTypes: ['int32', 'int32'],
      parameterNames: ['excludeDeclarationsFromPCH', 'displayDiagnostics'],
      returnType: _voidPointer,
    ),
    Func(
      name: 'clang_disposeIndex',
      parameterTypes: [_voidPointer],
      parameterNames: ['index'],
      returnType: 'void',
    ),
    Func(
      name: 'clang_parseTranslationUnit',
      parameterTypes: [
        _voidPointer,
        _charPointer,
        _charPointerPointer,
        'int32',
        '*CXUnsavedFile',
        'uint32',
        'uint32'
      ],
      parameterNames: [
        'CIdx',
        'source_filename',
        'cmd_line_args',
        'num_cmd_line_args',
        'unsaved_files',
        'num_unsaved_files',
        'options',
      ],
      returnType: _voidPointer,
    ),
    Func(
        name: 'clang_disposeTranslationUnit',
        parameterTypes: [_voidPointer],
        parameterNames: ['cxtranslation_unit'],
        returnType: 'void'),
    Func(
      name: 'clang_getNumDiagnostics',
      parameterTypes: [_voidPointer],
      parameterNames: ['unit'],
      returnType: 'Uint32',
    ),
    Func(
      name: 'clang_getDiagnostic',
      parameterTypes: [_voidPointer, 'int32'],
      returnType: _voidPointer,
      parameterNames: ['cxTranslationUnit', 'position'],
    ),
    Func(
        name: 'clang_formatDiagnostic',
        parameterTypes: [_voidPointer, 'Uint32'],
        parameterNames: ['diagnostic', 'diagnosticOptions'],
        returnType: '*CXString'),
    Func(
        name: 'clang_defaultDiagnosticDisplayOptions',
        parameterTypes: [],
        returnType: 'Uint32'),
    Func(
      name: 'clang_getCString',
      parameterTypes: ['*CXString'],
      parameterNames: ['cxstringPtr'],
      returnType: _charPointer,
    ),
    Struct(name: 'CXTranslationUnitImpl', fields: []),
    Struct(name: 'CXUnsavedFile', fields: []),
    Struct(name: 'CXString', fields: []),
  ],
);
