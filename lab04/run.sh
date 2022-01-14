#!/usr/bin/env bash

set -o errexit

. ../util/util.sh

npx everdev se reset
rm -fr *.abi.json *.tvc

printf "Compile contract... "
npx everdev sol compile A.sol
npx everdev sol compile B.sol
npx everdev sol compile C.sol
echo "✓"

echo "Deploy contract A..."
npx everdev contract deploy A --value 1000000000
addressA=$(addressContract A)

echo "Deploy contract C..."
npx everdev contract deploy C --value 1000000000
addressC=$(addressContract C)

echo "Deploy contract B..."
npx everdev contract deploy B --input "a:'0:${addressA}',c:'0:${addressC}'" --value 1000000000

. ./run-interact.sh

