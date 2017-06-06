FROM debian:9

RUN apt-get update && apt-get install -yq cmake git build-essential python python-dev

WORKDIR /opt

RUN git clone https://github.com/llvm-mirror/llvm llvm

RUN cd llvm/tools && git clone https://github.com/llvm-mirror/clang

RUN cd llvm/tools/clang/tools && git clone https://github.com/llvm-mirror/clang-tools-extra extra

RUN cd llvm/projects && git clone https://github.com/llvm-mirror/compiler-rt compiler-rt

RUN cd llvm/projects && git clone https://github.com/llvm-mirror/libcxx libcxx

RUN mkdir -p build && cd build && cmake -G "Unix Makefiles" ../llvm


RUN cd build ; make

RUN cd build ; make check-clang
