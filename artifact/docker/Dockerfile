# This is the Docker file of the Hush artifact.
# To run the experiments, do:
#
# docker run -v ./output_dir:/hush-benchmarks/artifact/results hush-artifact
#
# Author: Caio Vinícius Raposo Ribeiro
# Date: 2024-08-18

# Use the official Rust 1.80 and Alpine Linux 3.19 image
FROM rust:1.80-alpine3.19

# Install dependencies
RUN apk add --no-cache git musl-dev && \
    apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing time

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

ENTRYPOINT ["/bin/sh", "-c", "hush run.hsh results"]
