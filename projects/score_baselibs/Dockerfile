FROM gcr.io/oss-fuzz-base/base-builder

RUN apt-get update && apt-get install -y \
    curl \
    git \
    python3 \
    pkg-config

# Bazel 설치
RUN curl -fsSL https://github.com/bazelbuild/bazelisk/releases/latest/download/bazelisk-linux-amd64 \
    -o /usr/local/bin/bazel && chmod +x /usr/local/bin/bazel

RUN git clone --depth=1 https://github.com/eclipse-score/baselibs.git $SRC/baselibs

COPY build.sh $SRC/
WORKDIR $SRC
