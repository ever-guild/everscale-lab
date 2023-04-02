#!/usr/bin/env bash

set -o errexit

name="${1}"
solcOption="${2}"

if [ "${name}" == "" ]; then
  echo "Contract name is empty"
  exit 1
fi

if [ ! -f "${name}.origin.tvc" ] && [ ! -f "${name}.sol" ]; then
  echo "Not exist ${name}.sol or ${name}.origin.tvc"
  exit 1
fi

solc="$HOME/.everdev/solidity/solc $solcOption"
lib="$HOME/.everdev/solidity/stdlib_sol.tvm"
tvm_linker="$HOME/.everdev/solidity/tvm_linker"

hash=$(npx tonos-cli decode stateinit --tvc "${name}.origin.tvc" | tail -n +5 | jq -r .code_hash)
echo "Origin code hash: ${hash}"

$solc "${name}.sol" &>tvm_verify.log
$tvm_linker compile \
  --lib "$lib" \
  --abi-json "${name}.abi.json" \
  -o "${name}.tvc" "${name}.code" &>>tvm_verify.log
$tvm_linker disasm text "${name}.tvc" > "${name}.disasmed"
$tvm_linker disasm text "${name}.origin.tvc" > "${name}.origin.disasmed"

sha256sum "${name}.disasmed" "${name}.origin.disasmed"
