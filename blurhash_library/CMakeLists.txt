cmake_minimum_required(VERSION 3.7 FATAL_ERROR)
project(blurhash_library VERSION 1.0.0 LANGUAGES C)
add_library(blurhash_library SHARED blurhash_stb.c blurhash.def)
add_executable(blurhash_test blurhash_stb.c)

set_target_properties(blurhash_library PROPERTIES
    PUBLIC_HEADER blurhash.h
    VERSION ${PROJECT_VERSION}
    SOVERSION 1
    OUTPUT_NAME "blurhash"
    XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "Hex_Identity_ID_Goes_Here"
)
