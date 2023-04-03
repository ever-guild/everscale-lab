#!/usr/bin/env zx
import 'zx/globals'
$.verbose = false;

await $`everdev se reset &> /dev/null`
await $`everdev network default se`

await $`everdev sol compile Dummy.sol`

const seed = (await $`tonos-cli genphrase`).stdout.match(/(\b\w+\b\s){11}\b\w+\b/)[0]
await $`everdev signer add Dummy ${seed}`

const pubKey = (await $`tonos-cli genpubkey ${seed} | grep key`).stdout.match(/\w{64}/)[0]
console.log(`I will create contract with pubkey: ${pubKey}`);
await $`everdev c d Dummy.abi.json -v 1000000000 -s Dummy`

console.log('Retrieve pubkey from data of Dummy contract: ')
const data = (await $`everdev c info Dummy -s Dummy | grep \\"data\\": | cut -d '"' -f4 | xargs`).stdout;
const buffer = Buffer.from(data, 'base64');
const bufString = buffer.toString('hex');
console.log(bufString.substr(26,64))

$`everdev signer delete Dummy`