FROM gcr.io/oss-fuzz-base/base-builder

RUN apt-get update && apt-get install -y \
    cmake \
    ninja-build \
    python3 \
    curl \
    git

# baselibs 소스 복사 (로컬에 이미 있으므로)
COPY baselibs $SRC/baselibs
WORKDIR $SRC/baselibs
COPY build.sh $SRC/
