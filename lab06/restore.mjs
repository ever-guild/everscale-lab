import 'zx/globals'
const fs = require("fs")
const path = require("path")
const { TonClient } = require("@tonclient/core");
const { libNode } = require("@tonclient/lib-node");
const { Account } = require("@tonclient/appkit");
const { TestContract } = require("./TestContract.js");

TonClient.useBinaryLibrary(libNode)

const addr = '0:' + (await $`echo $(everdev contract info Test -d "chunkNum:1000000000" | grep Address | cut -d':' -f3 | cut -d' ' -f1)`).stdout.replace(/(\r\n|\n|\r)/gm, "");;

const client = new TonClient({
    network: {
        server_address: "localhost",
    }
});
const getListOfChunks = async () => {
    try {
        const account = new Account(TestContract, { address: addr, client });
        const response = await account.runLocal("chunksList", {});
        return response.decoded.output.chunksList;
    } catch (e) {
        console.log(`response is: ${JSON.stringify(e, null, 4)}`);
    }
};

const getChunk = async (contractAddress) => {
    try {
        const account = new Account(TestContract, { address: contractAddress, client });
        const response = await account.runLocal("m_chunk", {});
        return response.decoded.output.m_chunk;
    } catch (e) {
        console.log(`response is: ${JSON.stringify(e, null, 4)}`);
    }
};
(async () => {
    const listOfChunks = await getListOfChunks();
    let base64 = '';
    for (const [, a] of Object.entries(listOfChunks))
        base64 += await getChunk(a);

    fs.writeFileSync("./img_out.txt", base64);
    client.close();
})()