#!/usr/bin/env bash

set -o errexit

. ../util/util.sh

npx everdev se reset
rm -fr *.abi.json *.tvc

# Deploy A - v1
npx everdev sol compile A.sol
npx everdev contract deploy A --value 1000000000
appAddress="$(addressContract A)"
cp A.abi.json app.abi.json

# Check version
npx everdev contract run-local --address "${appAddress}" app version

# Deploy B - v2
npx everdev sol compile B.sol
input=$(printf 'code:%s' "$(npx tonos-cli decode stateinit --tvc B.tvc | tail -n +5 | jq -r .code)")
echo "${input}"
npx everdev contract run --address "${appAddress}" app upgrade --input "${input}"
cp B.abi.json app.abi.json

# Check version
npx everdev contract run-local --address "${appAddress}" app version
