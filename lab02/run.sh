#!/usr/bin/env bash

set -o errexit

. ../util/util.sh

npx tondev se reset
rm -fr *.abi.json *.tvc

# Deploy A - v1
npx tondev sol compile A.sol
npx tondev contract deploy A --value 1000000000
appAddress="0:$(addressContract A)"
cp A.abi.json app.abi.json


# Check version
npx tondev contract run-local --address "${appAddress}" app version

# Deploy B - v2
npx tondev sol compile B.sol
input=$(printf 'code:%s' "$(npx tonos-cli decode stateinit --tvc B.tvc | tail -n +5 | jq -r .code)")
echo "${input}"
npx tondev contract run --address "${appAddress}" app upgrade --input "${input}"
cp B.abi.json App.abi.json

# Check version
npx tondev contract run-local --address "${appAddress}" app version
