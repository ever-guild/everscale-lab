#!/usr/bin/env bash

set -o errexit

echo "Interact contract..."
npx everdev contract run-local B result
npx everdev contract run B some --input "foo:1"
npx everdev contract run-local B result
