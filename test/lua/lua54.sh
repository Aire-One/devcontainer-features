#!/bin/bash

set -e

source dev-container-features-test-lib

check "lua binary is available with the correct version" lua -v | grep "Lua 5.4.8"

reportResults
