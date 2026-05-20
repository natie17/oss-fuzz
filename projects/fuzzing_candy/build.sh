#!/bin/bash -eu
# 1. 원본 소스 컴파일
$CC $CFLAGS -c vulnerable.c -o vulnerable.o

# 2. AI가 생성할 하네스 파일(fuzz_target.cc 또는 fuzz_target.c) 컴파일
# 어떤 이름으로 생성하든 빌드되도록 세팅
IFILE=$(ls fuzz_target.cc fuzz_target.c 2>/dev/null | head -n 1)
$CXX $CXXFLAGS -c $IFILE -o fuzz_target.o

# 3. 퍼징 엔진 라이브러리와 결합하여 최종 바이너리 생성 (구글 규칙 $OUT 경로)
$CXX $CXXFLAGS $LIB_FUZZING_ENGINE fuzz_target.o vulnerable.o -o $OUT/fuzz_candy_fuzzer
