#!/bin/bash -eu
$CC $CFLAGS -c $SRC/vulnerable_lib.c -o $WORK/vulnerable_lib.o
FUZZER_TARGET_SRC=${1:-$SRC/fuzz_target.cc}
$CXX $CXXFLAGS \
    $FUZZER_TARGET_SRC \
    $WORK/vulnerable_lib.o \
    -I$SRC \
    -o $OUT/fuzz_target \
    $LIB_FUZZING_ENGINE
