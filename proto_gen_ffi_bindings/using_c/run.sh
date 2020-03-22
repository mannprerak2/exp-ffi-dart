a=`pwd`
cd ~/exp-dart-ffi/exp-ffi-dart/proto_gen_ffi_bindings/using_c

clang -lclang test_in_c.c 
./a.out ../test.h

cd $pwd