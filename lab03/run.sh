#!/usr/bin/env bash

set -o errexit

. ../util/util.sh

npx everdev se reset
rm -fr *.abi.json *.tvc

# Deploy A
npx everdev sol compile A.sol
npx everdev contract deploy A --value 1000000000

# Interact
npx everdev contract run-local A process --input "a:1,b:1,mode:0"
npx everdev contract run-local A process --input "a:1,b:1,mode:1"

