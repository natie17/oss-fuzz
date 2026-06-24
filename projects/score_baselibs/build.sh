#!/bin/bash -eu

cd $SRC/baselibs

# Bazel로 json 라이브러리 빌드
bazel build \
    --config=x86_64-linux \
    --copt="-fsanitize=address" \
    --copt="-fsanitize=fuzzer-no-link" \
    --copt="-fno-omit-frame-pointer" \
    --linkopt="-fsanitize=address" \
    //score/json:json_parser

# 빌드된 오브젝트 파일 찾기
BAZEL_OUT=$(bazel info bazel-bin)

# fuzz target 빌드
$CXX $CXXFLAGS \
    $SRC/fuzz_target.cc \
    -I$SRC/baselibs \
    $BAZEL_OUT/score/json/libjson_parser.a \
    -o $OUT/fuzz_target \
    $LIB_FUZZING_ENGINE
