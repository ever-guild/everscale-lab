#!/usr/bin/env zx
import 'zx/globals'

await $`everdev se reset &> /dev/null`
await $`everdev network default se`
await $`everdev sol compile S.sol`

await $`everdev c deploy S.abi.json --value 1000000000 | grep deployed | xargs`

//pass struct to function 
await $`everdev c r S structReceiver -i '{"a":{"ui":1,"text":"Incredible Everscale"}}'`
