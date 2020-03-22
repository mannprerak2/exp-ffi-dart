cmake_minimum_required(VERSION 3.7 FATAL_ERROR)
project(my_library VERSION 1.0.0 LANGUAGES C)
add_library(my_library SHARED test_in_c.c)
add_executable(my_test test_in_c.c )
target_link_libraries(my_test clang-c)

set_target_properties(my_library PROPERTIES
    VERSION ${PROJECT_VERSION}
    SOVERSION 1
    OUTPUT_NAME "my"
    XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "Hex_Identity_ID_Goes_Here"
)
