FROM gcr.io/oss-fuzz-base/base-builder

RUN apt-get update && apt-get install -y \
    cmake \
    zlib1g-dev \
    pkg-config

RUN git clone --depth=1 https://github.com/COVESA/dlt-daemon.git $SRC/dlt-daemon

COPY build.sh $SRC/
WORKDIR $SRC
