from ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Africa/Johannesburg

WORKDIR /home
RUN curl -LO https://ziglang.org/builds/zig-linux-x86_64-0.10.0-dev.2624+d506275a0.tar.xz
RUN tar -xf zig-linux-x86_64-0.10.0-dev.2624+d506275a0.tar.xz
ENV PATH=$PATH:/home/zig-linux-x86_64-0.10.0-dev.2624+d506275a0/

