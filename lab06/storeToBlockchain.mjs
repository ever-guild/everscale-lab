#!/usr/bin/env zx
import 'zx/globals'
const fs = require("fs")
const path = require("path")
await $`everdev se reset &> /dev/null`
await $`everdev network default se`
await $`everdev sol compile Test.sol`
await $`everdev c deploy Test.abi.json --value 100000000000 -i "chunk:" -d "chunkNum:1000000000" | grep deployed | xargs`
const a = fs.readFileSync(path.resolve(__dirname, 'img.txt'));
const chunkSize = 15_000;
for (let i = 0; i < (a.length / chunkSize); i++) {
  let start = i * chunkSize;
  let end = (i + 1) * chunkSize;
  let params = `{"s":"${a.slice(start, end)}","chunk":${i}}`;
  $`everdev c r Test add -i ${params} -d "chunkNum:1000000000"`;
}

