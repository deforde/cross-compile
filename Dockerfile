from ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Africa/Johannesburg

RUN apt update && apt install -y \
    clang \
    lld \
    make \
    curl \
    xz-utils \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /home

RUN curl -L https://ziglang.org/builds/zig-linux-x86_64-0.10.0-dev.2624+d506275a0.tar.xz | \
    tar -xJ --strip-components=1 -C zig
ENV PATH=$PATH:/home/zig

RUN curl -L https://github.com/phracker/MacOSX-SDKs/releases/download/11.3/MacOSX11.3.sdk.tar.xz | \
    tar -xJ --strip-components=1 -C macos-sdk

COPY build.sh /home/build.sh

ENTRYPOINT ["/home/build.sh"]

