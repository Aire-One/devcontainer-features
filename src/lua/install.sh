#! /usr/bin/env sh

set -e

# Validate version
VERSION=${VERSION:-"5.5.0"}
case "$VERSION" in
    5.1.5|5.3.6|5.4.8|5.5.0) ;;
    *)
        echo "Error: Unsupported Lua version: $VERSION"
        echo "Supported versions are: 5.1.5, 5.3.6, 5.4.8, 5.5.0"
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

# Validate checksum
checksum=""
case "$VERSION" in
    5.1.5)
        checksum="2640fc56a795f29d28ef15e13c34a47e223960b0240e8cb0a82d9b0738695333"
        ;;
    5.3.6)
        checksum="fc5fd69bb8736323f026672b1b7235da613d7177e72558893a0bdcd320466d60"
        ;;
    5.4.8)
        checksum="4f18ddae154e793e46eeab727c59ef1c0c0c2b744e7b94219710d76f530629ae"
        ;;
    5.5.0)
        checksum="57ccc32bbbd005cab75bcc52444052535af691789dba2b9016d5c50640d68b3d"
        ;;
esac

echo "${checksum} lua-${VERSION}.tar.gz" | sha256sum -c -

# Extract, build, and install Lua
tar xzf lua-${VERSION}.tar.gz

cd lua-${VERSION}

make -j"$(nproc)" linux
make install

# Cleanup
cd ..

rm -rf lua-${VERSION} lua-${VERSION}.tar.gz
