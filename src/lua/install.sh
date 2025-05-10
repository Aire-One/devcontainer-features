#! /usr/bin/env sh

set -e

apt-get update -y
apt-get install -y \
    build-essential \
    curl \
    libreadline-dev \
    tar

VERSION="${VERSION:-"5.4.7"}"

curl -L -R -O https://www.lua.org/ftp/lua-${VERSION}.tar.gz

# TODO: test checksum

tar xzf lua-${VERSION}.tar.gz

cd lua-${VERSION}

make -j"$(nproc)" linux
make install

cd ..

rm -rf lua-${VERSION} lua-${VERSION}.tar.gz
