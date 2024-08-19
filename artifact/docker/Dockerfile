# This is the Docker file of the Hush artifact.
# To run the different research quentions, do:
#
# docker run --rm docker-artifact hush rq1.hsh
# docker run --rm docker-artifact hush rq2.hsh
#
# Author: Caio Vinícius Raposo Ribeiro
# Date: 2024-08-18

# Use the official Rust 1.80 and Alpine Linux 3.19 image
FROM rust:1.80-alpine3.19

# Install dependencies
RUN apk add --no-cache git musl-dev && \
    apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing time

# Python and matplotlib
RUN apk add --no-cache tesseract-ocr python3 py3-numpy && \
    pip3 install --upgrade pip setuptools wheel && \
    apk add --no-cache --virtual .build-deps gcc g++ zlib-dev make python3-dev py-numpy-dev jpeg-dev && \
    pip3 install matplotlib && \
    apk del .build-deps

# Compile and install four versions of Hush: onwership-pointers, unsafe,
# guarded, and alias set.
RUN git clone https://github.com/caioraposo/hush && cd hush && \
    git checkout ownership-pointers && cargo build --release && \
    cp ./target/release/hush /usr/local/bin/hush && \
    cp ./target/release/hush /usr/local/bin/ohush && \
    git checkout unsafe-memoization && cargo build --release && \
    cp ./target/release/hush /usr/local/bin/uhush && \
    git checkout guarded-memoization && cargo build --release && \
    cp ./target/release/hush /usr/local/bin/ghush && \
    git checkout alias-set && cargo build --release && \
    cp ./target/release/hush /usr/local/bin/ahush


# Clone the hush-benchmarks directory
RUN git clone https://github.com/caioraposo/hush-benchmarks

# Set the working directory
WORKDIR /hush-benchmarks/artifact

ENTRYPOINT ["/bin/sh", "-c", "hush run.hsh results && python make-plots.py results"]
