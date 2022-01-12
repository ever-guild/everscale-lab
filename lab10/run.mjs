#!/usr/bin/env zx
import 'zx/globals'

await $`everdev se reset &> /dev/null`
await $`everdev network default se`
await $`everdev sol compile Test.sol`

await $`everdev c deploy Test.abi.json --value 1000000000 | grep deployed | xargs`

await $`everdev c r Test go &> /dev/null`
$`everdev c l Test counter1 | grep counter1 | xargs`
$`everdev c l Test counter2 | grep counter2 | xargs`