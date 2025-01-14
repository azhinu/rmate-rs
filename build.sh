#!/bin/sh
#shellcheck disable=SC2086,SC2016
## Constants
GRN='\033[0;32m'
ORNG='\033[0;0;33m'
NC='\033[0m' # No Color

case $1 in
  *"help" | *"h" | "")
    echo ''$GRN'This script build app in docker
    Usage: $0 <os target> [--keep]
    Options:
      --keep | Keep container after building completed
    E.g
    '$ORNG'$0 aarch64-unknown-linux-musl'$NC''
    exit 1
    ;;
esac

if [ $2 != "--keep" ]; then
  keep="--rm"
else
  keep=""
fi

docker run -v $keep "$(dirname "$(realpath $0)")":/app rust:alpine ash -c '
                                    set -eux
                                    apk add --no-cache libc-dev
                                    rustup target add '$1'
                                    cd /app
                                    export CARGO_TARGET_AARCH64_UNKNOWN_LINUX_MUSL_RUSTFLAGS="-C linker=rust-lld"
                                    cargo build --release --target='$1'
                                    '                                                                                                                                                                                                                           
