## Exploring dart FFI

- [blurhash_generator](./blurhash_generator): Prints blurhash string for an image using blurhash C API
- *function_struct_by_value*: failed experiment
- [json_parser_ffi](./json_parser_ffi): Parsing JSON using cJSON and comparing results with dart:convert
- [proto_gen_ffi_bindings](./proto_gen_ffi_bindings): Prototype for generating dart ffi bindings from C header files using libclang
- [string_play](./string_play): Using a few string.h operations in dart ffi


### Steps for setting up FFI-

1. Creating a Dynamic Library (*.so / .dll / .dylib files depending on OS*)
    - Add relevant C files
    - Create a CMakeLists.txt file and set it up to generate a dynamic library with all symbols and functions required

2. Calling C code in dart
    1. Defining variables for use
        - typedefs for C function
        - typdefs for Dart function to call
    2. Open Dynamic Library based on Path
    3. Lookup function in dynamic lib and store reference
    4. Call function