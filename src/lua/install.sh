#! /usr/bin/env sh

set -e

# Validate version
VERSION=${VERSION:-"5.4.8"}
case "$VERSION" in
    5.1.5|5.3.6|5.4.8) ;;
    *)
        echo "Error: Unsupported Lua version: $VERSION"
        echo "Supported versions are: 5.1.5, 5.3.6, 5.4.8"
        exit 1
        ;;
esac

# Install dependencies
apt-get update -y
apt-get install -y \
    build-essential \
    curl \
    libreadline-dev \
    tar

curl -L -R -O https://www.lua.org/ftp/lua-${VERSION}.tar.gz

# TODO: test checksum

# Extract, build, and install Lua
tar xzf lua-${VERSION}.tar.gz

cd lua-${VERSION}

make -j"$(nproc)" linux
make install

# Cleanup
cd ..

rm -rf lua-${VERSION} lua-${VERSION}.tar.gz
