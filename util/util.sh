#!/usr/bin/env bash

addressWallet() {
    name="${1:-alice}"
    address=$(npx tondev contract info --signer "${name}" SafeMultisigWallet | grep Address | cut -d':' -f3 | cut -d' ' -f1)
    printf "%s" "${address}"
}

addressContract() {
    contract="${1}"
    address=$(npx tondev contract info "${contract}" | grep Address | cut -d':' -f3 | cut -d' ' -f1)
    printf "%s" "${address}"
}

balanceWallet() {
    name="${1:-alice}"
    balance=$(npx tonos-cli account "$(addressWallet "${name}")" | grep balance | cut -d' ' -f8)
    printf "%s" "${balance}"
}

createWallet() {
  name="${1:-alice}"
  value="${2:-100000000000}"
  if [ ! -f SafeMultisigWallet.abi.json ]; then
      wget --quiet https://raw.githubusercontent.com/tonlabs/ton-labs-contracts/5ee039e4d093b91b6fdf7d77b9627e2e7d37f000/solidity/safemultisig/SafeMultisigWallet.tvc
      wget --quiet https://raw.githubusercontent.com/tonlabs/ton-labs-contracts/5ee039e4d093b91b6fdf7d77b9627e2e7d37f000/solidity/safemultisig/SafeMultisigWallet.abi.json
  fi
  npx tondev signer generate "${name}" &> /dev/null
  keyPublic="0x$(npx tondev signer info "${name}" | jq -r .keys.public)"
  input="owners:[$keyPublic],reqConfirms:1"
  npx tondev contract deploy --signer "${name}" SafeMultisigWallet --value "${value}" --input "${input}" &> /dev/null
  echo "Created wallet 0:$(addressWallet "${name}") with $(balanceWallet "${name}") nanoever for ${name}"
}

submitTransaction() {
  signer=${1}
  contractName=${2}
  method=${3}
  param=${4}
  value=${5:-100000000} # 0.01
  address="0:$(addressContract "${contractName}")"
  body=$(npx tonos-cli body --abi "${contractName}.abi.json" "${method}" "${param}" | grep body | cut -d' ' -f3)
  input="dest:'${address}',value:${value},allBalance:false,bounce:true,payload:'$body'"
  echo "input=$input"
  npx tondev contract run --signer "${signer}" SafeMultisigWallet submitTransaction --input "$input"
}
