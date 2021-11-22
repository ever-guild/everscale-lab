#!/usr/bin/env bash

set -o errexit

. ../util/util.sh

npx tondev se reset
rm -fr *.abi.json *.tvc

# Deploy A
npx tondev sol compile A.sol
npx tondev contract deploy A --value 1000000000

# Deploy B
npx tondev sol compile B.sol
npx tondev contract deploy B --value 1000000000
addressB=$(addressContract B)
echo "addressB ${addressB}"

npx tondev contract run-local B doc
npx tondev contract run A addToB --input "addr:${addressB},content:foo"
npx tondev contract run-local B doc
