#!/usr/bin/env zx
import 'zx/globals'

await $`everdev se reset &> /dev/null`
await $`everdev network default se`
await $`everdev sol compile CellConverter.sol`

await $`everdev c deploy CellConverter.abi.json --value 1000000000 | grep deployed | xargs`

//convert from string to TvmCell
const boc = (await $`everdev c l CellConverter stringToCell -i "s:"❤EverScale❤"" | grep value0 | cut -d'"' -f4`).stdout

//convert from TvmCell to String
const str = (await $`everdev c l CellConverter cellToString -i "c:"${boc}"" | grep value0 | cut -d'"' -f4`).stdout
