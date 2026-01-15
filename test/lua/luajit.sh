#!/bin/bash

set -e

source dev-container-features-test-lib

luajit -v

check "lua binary is available with the correct version" luajit -v | grep "LuaJIT 2.1.*"

reportResults
