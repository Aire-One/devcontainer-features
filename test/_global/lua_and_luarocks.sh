#!/bin/bash

set -e

source dev-container-features-test-lib

check "luarocks binary is available" luarocks --version

reportResults
