#!/bin/bash

set -e

source dev-container-features-test-lib

check "lua binary is available" lua -v

reportResults
