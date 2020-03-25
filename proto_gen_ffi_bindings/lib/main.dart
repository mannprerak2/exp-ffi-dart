import 'dart:ffi';
import 'dart:io' show File;
import 'package:ffi/ffi.dart';
import 'clang_bindings/generated_bindings.dart' as bindings;
import 'clang_bindings/constants.dart' as constants;
import 'package:ffi_tool/c.dart';

List<Element> elements = [];
List<Pointer<bindings.CXCursor>> functionCursors = [];

void main(List<String> arguments) {
  String file =
      './test.h'; // default if file name isn't given via cmd line args
  if (arguments.length > 0) {
    print("cmd arguments: " + arguments.toString());
    file = arguments[0];

    if (arguments[0] == '--test') {
      print("Running test funcion from C");
      bindings.test_in_c();
      return;
    }
  }
  var index = bindings.clang_createIndex(0, 0);

  var tu = bindings.clang_parseTranslationUnit(index, Utf8.toUtf8(file),
      nullptr, 0, nullptr, 0, constants.General.CXTranslationUnit_None);

  if (tu == nullptr) {
    print("Error in creating TU");
    return;
  }

  printAllDiagnostic(tu);
  var rootCursor = bindings.clang_getTranslationUnitCursor_wrap(tu);

  functionCursors.clear();
  bindings.clang_visitChildren_wrap(
    rootCursor,
    Pointer.fromFunction(rootCursorVisitor, 0),
    nullptr,
  );

  for (var cursor in functionCursors) {
    visitFunctionChildren(cursor);
  }

  generateBindings();
  bindings.clang_disposeTranslationUnit(tu);
  bindings.clang_disposeIndex(index);
}

int rootCursorVisitor(Pointer<bindings.CXCursor> cursor,
    Pointer<bindings.CXCursor> parent, Pointer<Void> clientData) {
  if (bindings.clang_getCursorKind_wrap(cursor) ==
      constants.CursorKind.CXCursor_FunctionDecl) {
    functionCursors.add(cursor);
  }
  free(parent);
  return constants.Visitor.CXChildVisit_Continue;
}

var parameterNames = <String>[];
var parameterTypes = <String>[];
void visitFunctionChildren(Pointer<bindings.CXCursor> cursor) {
  parameterNames.clear();
  parameterTypes.clear();
  bindings.clang_visitChildren_wrap(
      cursor, Pointer.fromFunction(parameterCursorVisitor, 0), nullptr);

  elements.add(Func(
    name: cursor.spelling(),
    parameterNames: List.from(parameterNames),
    parameterTypes: List.from(parameterTypes),
    returnType: returnTypeString(bindings
        .clang_getResultType_wrap(bindings.clang_getCursorType_wrap(cursor))),
  ));
  free(cursor);
}

int parameterCursorVisitor(Pointer<bindings.CXCursor> cursor,
    Pointer<bindings.CXCursor> parent, Pointer<Void> clientData) {
  if (bindings.clang_getCursorKind_wrap(cursor) ==
      constants.CursorKind.CXCursor_ParmDecl) {
    var name = cursor.spelling();
    // print(bindings.clang_getCursorType_wrap(cursor).ref.kind==constants.CursorType.CXType_Pointer);
    var type = returnTypeString(bindings.clang_getCursorType_wrap(cursor));
    parameterNames.add(name);
    parameterTypes.add(type);
  }
  free(cursor);
  free(parent);
  return constants.Visitor.CXChildVisit_Continue;
}

String returnTypeString(Pointer<bindings.CXType> type) {
  switch (type.ref.kind) {
    case constants.CursorType.CXType_Int:
      return 'int32';
    case constants.CursorType.CXType_Float:
      return 'float';
    case constants.CursorType.CXType_Double:
      return 'double';
    case constants.CursorType.CXType_Pointer:
      return '*' + returnTypeString(bindings.clang_getPointeeType_wrap(type));
    default:
      return 'unimplemented';
  }
}

void printCursorInfo(Pointer<bindings.CXCursor> cursor) {
  print(
      '${cursor.spelling()} kindNum:${bindings.clang_getCursorKind_wrap(cursor)} ${cursor.kindSpelling()} typeNum:${bindings.clang_getCursorType_wrap(cursor).ref.kind} ${cursor.typeSpelling()}');
}

void generateBindings() {
  final library = Library(
      dynamicLibraryPath: 'path/to/dynamic/library', elements: elements);
  generateFile(File('test_generated.dart'), library);
}

void printAllDiagnostic(Pointer<bindings.CXTranslationUnitImpl> tu) {
  var total = bindings.clang_getNumDiagnostics(tu);
  print("Total errors/warnings: $total");
  for (int i = 0; i < total; i++) {
    var diag = bindings.clang_getDiagnostic(tu, i);
    var cxstring = bindings.clang_formatDiagnostic_wrap(diag, 0);
    print(cxstring.str());
  }
}

extension on Pointer<bindings.CXCursor> {
  String kindSpelling() {
    var cxstring = bindings.clang_getCursorKindSpelling_wrap(
        bindings.clang_getCursorKind_wrap(this));
    var str = cxstring.str();
    free(cxstring);
    return str;
  }

  String spelling() {
    var cxstring = bindings.clang_getCursorSpelling_wrap(this);
    var s = cxstring.str();
    free(cxstring);
    return s;
  }

  String typeSpelling() {
    var cxstring = bindings
        .clang_getTypeSpelling_wrap(bindings.clang_getCursorType_wrap(this));
    var s = cxstring.str();
    free(cxstring);
    return s;
  }
}

extension on Pointer<bindings.CXString> {
  String str() {
    // str is a const char *, calling free will result in error
    var str = bindings.clang_getCString_wrap(this);
    String s = Utf8.fromUtf8(str);
    return s;
  }
}
