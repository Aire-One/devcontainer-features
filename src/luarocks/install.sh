#! /usr/bin/env sh

set -e

apt-get update -y
apt-get install -y \
    build-essential \
    tar \
    wget

VERSION="${VERSION:-"3.11.1"}"

wget https://luarocks.github.io/luarocks/releases/luarocks-${VERSION}.tar.gz -O - | tar -xzf -

cd luarocks-${VERSION}

./configure
make build
make install

rm -rf luarocks-${VERSION}
