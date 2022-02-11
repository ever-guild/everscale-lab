//SPDX-License-Identifier: UNLICENSED
pragma ton-solidity >= 0.51.0;

import "Acceptable.sol";
import "IStore.sol";

contract Consumer is Acceptable {
    IStore store;
    string public stash;

    function setup(address config)
    external accept
    {
        store = IStore(config);
        tvm.log(format("setup config:{}", config));
    }

    function write(string key, string content)
    external accept
    returns(bool out)
    {
        tvm.log(format("write start key:{} content:{}", key, content));
        out = store.set(key, content).await;
        tvm.log("write end");
    }

    function read(string key)
    external accept
    returns(string out)
    {
        tvm.log(format("read start key:{}", key));
        out = store.get(key).await;
        tvm.log(format("read end out:{}", out));
    }

    function put(string key)
    external accept
    {
        tvm.log(format("put start key:{}", key));
        stash = store.get(key).await;
        tvm.log(format("put end key:{}", stash));
    }
}
