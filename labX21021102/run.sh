#!/usr/bin/env bash

set -o errexit

. ../util/util.sh

if [ "${EVER_NETWORK}" == "se" ]; then
  npx everdev se reset
  rm -fr build
fi

# Deploy Store
npx everdev sol compile --code --output-dir build src/Store.sol
npx everdev contract deploy build/Store --value 1000000000000

# Deploy Consumer
npx everdev sol compile --code --output-dir build src/Consumer.sol
npx everdev contract deploy build/Consumer --value 1000000000000
npx everdev contract run build/Consumer setup --input "config:'$(addressContract build/Store)'"

# Interact

npx everdev contract run-local build/Consumer encode --input "content:foo"
npx everdev contract run-local build/Consumer decode --input "data:te6ccgEBAgEACAABAAEABmZvbw=="
npx everdev contract run build/Store set --input "key:1,value:te6ccgEBAgEACAABAAEABmZvbw==,answerId:0"
npx everdev contract run-local build/Store get --input "key:1,answerId:0"
npx everdev contract run build/Consumer read --input "key:1"
npx everdev contract run build/Consumer write --input "key:2,content:bar"
npx everdev contract run build/Consumer put --input "key:1"
npx everdev contract run-local build/Consumer stash
npx everdev contract run build/Consumer put --input "key:2"
npx everdev contract run-local build/Consumer stash
