#!/bin/bash -eu

mkdir -p /tmp/nlohmann_inc/nlohmann
curl -L https://github.com/nlohmann/json/releases/download/v3.11.3/json.hpp \
    -o /tmp/nlohmann_inc/nlohmann/json.hpp

mkdir -p /tmp/score_stub/score
echo "#pragma once" > /tmp/score_stub/score/utility.hpp

cd $SRC/baselibs

SOURCES=(
    "$SRC/baselibs/score/json/json_parser.cpp"
    "$SRC/baselibs/score/json/i_json_parser.cpp"
    "$SRC/baselibs/score/json/internal/parser/nlohmann/nlohmann_parser.cpp"
    "$SRC/baselibs/score/json/internal/parser/nlohmann/json_builder.cpp"
    "$SRC/baselibs/score/json/internal/model/any.cpp"
    "$SRC/baselibs/score/json/internal/model/number.cpp"
    "$SRC/baselibs/score/json/internal/model/error.cpp"
    "$SRC/baselibs/score/json/internal/model/null.cpp"
    "$SRC/baselibs/score/json/internal/model/lossless_cast.cpp"
    "$SRC/baselibs/score/memory/string_comparison_adaptor.cpp"
    "$SRC/baselibs/score/result/error.cpp"
    "$SRC/baselibs/score/result/error_code.cpp"
    "$SRC/baselibs/score/result/error_domain.cpp"
    "$SRC/baselibs/score/result/error_msg_mapping.cpp"
    "$SRC/baselibs/score/result/details/expected/expected.cpp"
    "$SRC/baselibs/score/result/details/expected/extensions.cpp"
    "$SRC/baselibs/score/language/futurecpp/src/assert.cpp"
)

# oss-fuzz-gen이 LLM 하네스를 이 경로에 복사함
FUZZ_TARGET="$SRC/baselibs/score/json/fuzz_json_parser.cpp"

$CXX $CXXFLAGS \
    -I$SRC/baselibs \
    -I$SRC/baselibs/score/language/futurecpp/include \
    -I/tmp/nlohmann_inc \
    -I/tmp/score_stub \
    -std=c++17 \
    "$FUZZ_TARGET" \
    "${SOURCES[@]}" \
    $LIB_FUZZING_ENGINE \
    -o $OUT/fuzz_json_parser

