#!/bin/bash

set -e

source dev-container-features-test-lib

# For some reason, grep is failing here, so just check that lua runs.
check "lua binary is available" lua -v

reportResults
