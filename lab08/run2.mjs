import 'zx/globals'

await $`everdev se reset &> /dev/null`
await $`everdev network default se`
await $`everdev sol compile CellConverter.sol`

await $`everdev c deploy CellConverter.abi.json --value 1000000000 | grep deployed | xargs`

//converting  struct to TvmCell
const boc = (await $`everdev c l CellConverter structToCell -i '{"a":{"i":1}}' | grep value0 | cut -d'"' -f4`).stdout

//convert from TvmCell to Struct
await $`everdev c l CellConverter cellToStruct -i "c:"${boc}"" | awk '/Execution/,0'`

