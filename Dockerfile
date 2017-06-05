FROM debian:9

RUN apt-get update && apt-get install -yq cmake subversion git build-essential

WORKDIR /opt

RUN svn co http://llvm.org/svn/llvm-project/llvm/trunk llvm

RUN cd llvm/tools && svn co http://llvm.org/svn/llvm-project/cfe/trunk clang

RUN cd llvm/tools/clang/tools && svn co http://llvm.org/svn/llvm-project/clang-tools-extra/trunk extra

RUN cd llvm/projects && svn co http://llvm.org/svn/llvm-project/compiler-rt/trunk compiler-rt

RUN cd llvm/projects && svn co http://llvm.org/svn/llvm-project/libcxx/trunk libcxx

RUN mkdir -p build && cd build && cmake -G "Unix Makefiles" ../llvm

