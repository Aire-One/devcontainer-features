#! /usr/bin/env sh

set -e

install_luapuc() {
    version=$1

    # Install dependencies
    apt-get update -y
    apt-get install -y \
        build-essential \
        curl \
        libreadline-dev \
        tar

    curl -L -R -O https://www.lua.org/ftp/lua-"${version}".tar.gz

    # Validate checksum
    checksum=""
    case "$version" in
    5.1.5)
        checksum="2640fc56a795f29d28ef15e13c34a47e223960b0240e8cb0a82d9b0738695333"
        ;;
    5.3.6)
        checksum="fc5fd69bb8736323f026672b1b7235da613d7177e72558893a0bdcd320466d60"
        ;;
    5.4.9)
        checksum="2335b6c582a52654f94612bf10d2f4672805d05329aa6568b1d8cd9e5c6fb8e6"
        ;;
    5.5.1)
        checksum="1c4b4068d67061f2a2231ad2b5422e77acea1487ea9890f6320af614f4373dce"
        ;;
    esac

    echo "${checksum} lua-${version}.tar.gz" | sha256sum -c -

    # Extract, build, and install Lua
    tar xzf lua-"${version}".tar.gz

    cd lua-"${version}"

    make -j"$(nproc)" linux
    make install

    # Cleanup
    cd ..

    rm -rf lua-"${version}" lua-"${version}".tar.gz
}

install_luajit() {
    # Install dependencies
    apt-get update -y
    apt-get install -y \
        git

    git clone https://luajit.org/git/luajit.git

    cd luajit

    make -j"$(nproc)"
    make install

    # Cleanup
    cd ..

    rm -rf luajit
}

VERSION=${VERSION:-"5.5.1"}

case "$VERSION" in
5.1.5 | 5.3.6 | 5.4.9 | 5.5.1)
    install_luapuc "$VERSION"
    ;;
luajit)
    install_luajit
    ;;
*)
    echo "Error: Unsupported Lua version: $VERSION"
    echo "Supported versions are: 5.1.5, 5.3.6, 5.4.9, 5.5.1"
    exit 1
    ;;
esac
