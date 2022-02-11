//SPDX-License-Identifier: UNLICENSED
pragma ton-solidity >= 0.51.0;

import "Acceptable.sol";
import "IStore.sol";

contract Consumer is Acceptable {
    IStore store;

    function setup(address config) public accept {
        store = IStore(config);
    }

    function decode(TvmCell data) public pure returns(string out)
    {
        (out) = abi.decode(data, (string));
    }

    function encode(string content) public pure returns(TvmCell out)
    {
        out = abi.encode(content);
    }

    function write(uint key, string content) public accept returns(bool out)
    {
        out = store.set(key, encode(content)).await;
    }

    function read(uint key) public accept returns(string out)
    {
        optional(TvmCell) data = store.get(key).await;
        if (data.hasValue()) out = decode(data.get());
    }

    string public stash;

    function put(uint key) public accept returns(string out)
    {
        stash = read(key);
        out = stash;
    }
}
