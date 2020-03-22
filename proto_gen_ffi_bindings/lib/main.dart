import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'clang_bindings/generated_bindings.dart' as bindings;
import 'clang_bindings/constants.dart';

void main(List<String> arguments) {
  // print("cmd arguments: " + arguments.toString());
  // if (arguments.length < 1) {
  //   print("Please input source file as cmd argument");
  //   return;
  // }
  var index = bindings.clang_createIndex(0, 0);

  var tu = bindings.clang_parseTranslationUnit(index, Utf8.toUtf8('./test.h'),
      nullptr, 0, nullptr, 0, Constants.CXTranslationUnit_None);

  if (tu == nullptr) {
    print("Error in creating TU");
    return;
  }

  printAllDiagnostic(tu);
  var rootcxcursor = bindings.clang_getTranslationUnitCursor(tu);

  // print(bindings.clang_getCursorKind(rootcxcursor));

  // print(bindings.clang_getCursorKind(tu));

  bindings.clang_disposeTranslationUnit(tu);
  bindings.clang_disposeIndex(index);
}

///
///
///
///
///
///
///
///
///

void printAllDiagnostic(Pointer<Void> tu) {
  var total = bindings.clang_getNumDiagnostics(tu);
  print("Total errors: $total");
  for (int i = 0; i < total; i++) {
    var diag = bindings.clang_getDiagnostic(tu, i);
    var cxstring = bindings.clang_formatDiagnostic(diag, 0);

    cxstring.printStr();
  }
}

extension on Pointer<bindings.CXString> {
  void printStr() {
    var str = bindings.clang_getCString(this);
    print(Utf8.fromUtf8(str));
    free(str);
  }

  String str() {
    var str = bindings.clang_getCString(this);
    var s = Utf8.fromUtf8(str);
    free(str);
    return s;
  }
}
