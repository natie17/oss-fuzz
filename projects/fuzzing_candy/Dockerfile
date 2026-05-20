FROM gcr.io/oss-fuzz-base/base-builder
# 필요한 빌드 도구 설치
RUN apt-get update && apt-get install -y make autoconf automake libtool
# 소스코드를 도커 내부 소스 디렉토리로 복사
COPY . $SRC/fuzzing_candy
WORKDIR $SRC/fuzzing_candy
# 빌드 스크립트를 $SRC 경로로 복사 (구글 규칙)
COPY build.sh $SRC/
