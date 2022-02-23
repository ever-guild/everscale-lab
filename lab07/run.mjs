#!/usr/bin/env zx
import 'zx/globals'
const fs = require("fs")
const path = require("path")
await $`everdev se reset &> /dev/null`
await $`everdev network default se`
await $`everdev sol compile Spammer1.sol`
await $`everdev sol compile Spammer2.sol`

await $`everdev c deploy Spammer1.abi.json --value 5000000000 | grep deployed | xargs`
await $`everdev c deploy Spammer2.abi.json --value 5000000000 | grep deployed | xargs`

let addrSpammer2 = ((await $`everdev contract info Spammer2.abi.json | grep Address | cut -d':' -f3 | cut -d' ' -f1 | xargs`).stdout)
const s = fs.readFileSync(path.resolve(__dirname, 'spam.txt')).slice(0, 15_000);

$`everdev c r Spammer1 start -i "s:"${s}",a:"${addrSpammer2}""`;