#!/usr/bin/env bash

set -o errexit

. ../util/util.sh

npx everdev se reset
rm -fr *.abi.json *.tvc

# Deploy A
npx everdev sol compile A.sol
npx everdev contract deploy A --value 1000000000

# Deploy B
npx everdev sol compile B.sol
npx everdev contract deploy B --value 1000000000
addressB=$(addressContract B)
echo "addressB ${addressB}"

npx everdev contract run-local B doc
npx everdev contract run A addToB --input "addr:${addressB},content:foo"
npx everdev contract run-local B doc
