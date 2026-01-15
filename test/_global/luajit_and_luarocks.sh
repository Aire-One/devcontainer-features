#!/bin/bash

set -e

source dev-container-features-test-lib

check "luajit binary is available" luajit -v
check "luarocks binary is available" luarocks --version

reportResults
