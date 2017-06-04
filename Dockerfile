FROM debian:9

RUN apt-get update && apt-get install -yq cmake git build-essentials
