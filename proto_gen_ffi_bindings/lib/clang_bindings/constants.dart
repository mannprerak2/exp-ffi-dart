class General {
  General._();

  static const CXTranslationUnit_None = 0x0;
}

class Visitor {
  Visitor._();

  static const CXChildVisit_Break = 0;
  static const CXChildVisit_Continue = 1;
  static const CXChildVisit_Recurse = 2;
}

class CursorKind {
  CursorKind._();

  static const CXCursor_FunctionDecl = 8;
  static const CXCursor_ParmDecl = 10;
}

class CursorType {
  CursorType._();

  static const CXType_Invalid = 0;
  static const CXType_Void = 2;
  static const CXType_Int = 17;
  static const CXType_FunctionProto = 111;
  static const CXType_Pointer = 101;
  static const CXType_Float = 21;
  static const CXType_Double = 22;
}
