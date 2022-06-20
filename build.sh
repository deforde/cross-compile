#!/usr/bin/env bash
set -eo pipefail
IFS=$'\n\t'

usage() {
    echo "Usage: $0 --makefile <makefile>"
}

MKFILE_DIR=""
MKFILE=""

while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do case $1 in
  -h | --help )
    usage
    exit 0
    ;;
  -f | --makefile )
    shift;
    MKFILE_PATH=$(realpath "$1")
    MKFILE_DIR=$(dirname "$MKFILE_PATH")
    MKFILE=$(basename "$MKFILE_PATH")
    ;;
esac; shift; done
if [[ "$1" == '--' ]]; then shift; fi

if [[ -z $MKFILE_DIR || -z $MKFILE ]]; then
    usage
    exit 1
fi

# x86_64 Linux
export AR="zig ar"
export CC="zig cc -target x86_64-linux-gnu"
export CXX="zig cc -target x86_64-linux-gnu"
make -C $MKFILE_DIR -f $MKFILE

# x86_64 Windows
export AR="zig ar"
export CC="zig cc -target x86_64-windows-gnu"
export CXX="zig c++ -target x86_64-windows-gnu"
make -C $MKFILE_DIR -f $MKFILE

# M1 Mac
export AR="clang ar"
# export CC="zig cc -target aarch64-macos"
# export CXX="zig c++ -target aarch64-macos"
export CC="clang -target aarch64-apple-macos-macho --sysroot /home/MacOSX11.3.sdk -fuse-ld=lld"
export CXX="clang++ -target aarch64-apple-macos-macho --sysroot /home/MacOSX11.3.sdk -fuse-ld=lld"
make -C $MKFILE_DIR -f $MKFILE

