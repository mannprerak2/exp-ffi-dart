A fast sphageti code prototype for generating ffi binding from C headers using LibClang and dart ffi

ffi_tool is used to create dart bindings for clang (see the tool folder)

## Challenges

1. Many functions return structs by value. So generating bindings isn't possible for them
   E.g `clang_parseTranslationUnit`, However replacing the return type with Pointer in some
   functions seems to make them work.
   However, Some functions cannot be called like this E.g `clang_getTranslationUnitCursor`.
   **Solution** -
   Wrapper functions are required
