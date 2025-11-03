#!/bin/bash

# This test file will be executed against an auto-generated devcontainer.json that
# includes the 'color' Feature with no options.
#
# For more information, see:
# https://github.com/devcontainers/cli/blob/main/docs/features/test.md

set -e

source dev-container-features-test-lib

check "lua binary is available with the correct version" lua -v | grep "Lua 5.4.8"

reportResults
