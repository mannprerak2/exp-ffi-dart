import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'clang_bindings/generated_bindings.dart' as bindings;
import 'clang_bindings/constants.dart';
import 'clang_bindings/typedefs.dart';

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
      nullptr, 0, nullptr, 0, Constants.CXTranslationUnit_None);

  if (tu == nullptr) {
    print("Error in creating TU");
    return;
  }

  printAllDiagnostic(tu);
  var rootCursor = bindings.clang_getTranslationUnitCursor_wrap(tu);

  bindings.clang_visitChildren_wrap(
    rootCursor,
    Pointer.fromFunction(cursorVisitor, 0),
    nullptr,
  );

  bindings.clang_disposeTranslationUnit(tu);
  bindings.clang_disposeIndex(index);
}

int cursorVisitor(Pointer<bindings.CXCursor> cursor,
    Pointer<bindings.CXCursor> parent, Pointer<Void> clientData) {
  print(cursor.ref.kind);

  free(cursor);
  free(parent);
  return Constants.CXChildVisit_Continue;
}

void printAllDiagnostic(Pointer<bindings.CXTranslationUnitImpl> tu) {
  var total = bindings.clang_getNumDiagnostics(tu);
  print("Total errors: $total");
  for (int i = 0; i < total; i++) {
    var diag = bindings.clang_getDiagnostic(tu, i);
    var cxstring = bindings.clang_formatDiagnostic_wrap(diag, 0);
    cxstring.printStr();
  }
}

extension on Pointer<bindings.CXString> {
  void printStr() {
    var str = bindings.clang_getCString_wrap(this);
    print(Utf8.fromUtf8(str));
    free(str);
  }

  String str() {
    var str = bindings.clang_getCString_wrap(this);
    var s = Utf8.fromUtf8(str);
    print(s);
    free(str);
    return s;
  }
}
