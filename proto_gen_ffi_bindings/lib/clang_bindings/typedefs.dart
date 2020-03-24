import 'dart:ffi';
import 'generated_bindings.dart' as bindings;

typedef visitorFunctionSignature = Int32 Function(
    Pointer<bindings.CXCursor> cursor,
    Pointer<bindings.CXCursor> parent,
    Pointer<Void> clientData);
