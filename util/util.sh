#!/usr/bin/env bash

EVER_NETWORK=$(npx everdev network list | grep Default | cut -d' ' -f1)
export EVER_NETWORK

addressWallet() {
    name="${1:-alice}"
    address=$(npx everdev contract info --signer "${name}" SafeMultisigWallet | grep Address | cut -d':' -f3 | cut -d' ' -f1)
    printf "%s" "${address}"
}

addressContract() {
    npx everdev contract info "${1}" | grep Address | cut -d' ' -f4
}

balanceAccount() {
  address="${1}"
  format="${2:-${EVER_FORMAT:-true}}"
  balance=$(npx tonos-cli account "${address}" | grep balance | cut -d' ' -f8)
  if [ "${format}" == "true" ]; then
    printf "%s" "$(toEVER "${balance}")"
  else
    printf "%s" "${balance}"
  fi
}

balanceContract() {
    contract="${1}"
    format="${2:-${EVER_FORMAT:-true}}"
    printf "%s" "$(balanceAccount "$(addressContract "${contract}")" "${format}")"
}

balanceWallet() {
    name="${1:-alice}"
    format="${2:-${EVER_FORMAT:-true}}"
    printf "%s" "$(balanceAccount "$(addressWallet "${name}")" "${format}")"
}

toEVER() {
  printf '%.2f' "$((${1}))e-9"
}

createWallet() {
  name="${1:-alice}"
  value="${2:-100051425001}"
  if [ ! -f SafeMultisigWallet.abi.json ]; then
      wget --quiet https://raw.githubusercontent.com/tonlabs/ton-labs-contracts/5ee039e4d093b91b6fdf7d77b9627e2e7d37f000/solidity/safemultisig/SafeMultisigWallet.tvc
      wget --quiet https://raw.githubusercontent.com/tonlabs/ton-labs-contracts/5ee039e4d093b91b6fdf7d77b9627e2e7d37f000/solidity/safemultisig/SafeMultisigWallet.abi.json
  fi
  npx everdev signer generate "${name}" >> everdev.log 2>&1
  keyPublic="0x$(npx everdev signer info "${name}" | jq -r .keys.public)"
  input="owners:[$keyPublic],reqConfirms:1"
  echo "$(TZ=EET date) createWallet" >> everdev.log 2>&1
  npx everdev contract deploy --signer "${name}" SafeMultisigWallet --value "${value}" --input "${input}" >> everdev.log 2>&1
  echo "Created wallet 0:$(addressWallet "${name}") with $(balanceWallet "${name}") for ${name}"
}

call() {
  contractName=${1}
  method=${2}
  input=${3}
  signer=${4:-se}
  npx everdev contract run --signer "${signer}" "${contractName}" "${method}" --input "$input" >> everdev.log 2>&1
}

submitTransaction() {
  signer=${1}
  contractName=${2}
  method=${3}
  param=${4}
  value=${5:-10000000} # 0.01
  address="0:$(addressContract "${contractName}")"
  body=$(npx tonos-cli body --abi "${contractName}.abi.json" "${method}" "${param}" | grep body | cut -d' ' -f3)
  input="dest:'${address}',value:${value},allBalance:false,bounce:true,payload:'$body'"
  echo "$(TZ=EET date) submitTransaction" >> everdev.log 2>&1
  echo "submitTransaction ${method} ${param} to ${contractName}"
  call SafeMultisigWallet submitTransaction "$input" "${signer}"
}
