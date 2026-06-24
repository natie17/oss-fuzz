#!/bin/bash -eu

cd $SRC/dlt-daemon
mkdir -p build && cd build

cmake .. \
    -DCMAKE_C_COMPILER=$CC \
    -DCMAKE_CXX_COMPILER=$CXX \
    -DCMAKE_C_FLAGS="$CFLAGS" \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS" \
    -DWITH_DLT_DBUS=OFF \
    -DWITH_DLT_TESTS=OFF \
    -DWITH_DLT_EXAMPLES=OFF \
    -DBUILD_SHARED_LIBS=OFF

make -j$(nproc)

$CC $CFLAGS \
    $SRC/fuzz_target.c \
    -I$SRC/dlt-daemon/include/dlt \
    -I$SRC/dlt-daemon/build/include \
    -L$SRC/dlt-daemon/build/src/shared \
    -ldlt-common \
    -lz \
    -o $OUT/fuzz_target \
    $LIB_FUZZING_ENGINE
