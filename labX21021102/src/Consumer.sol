//SPDX-License-Identifier: UNLICENSED
pragma ton-solidity >= 0.51.0;

import "Acceptable.sol";
import "IStore.sol";

contract Consumer is
Acceptable
{
    string public stash;
    IStore store;

    event onSetup(address config);
    event onWrite(string key, string content, bool status);
    event onRead(string key, string content);
    event onPut(string key, string content);

    function setup(address config)
    external accept
    {
        store = IStore(config);
        emit onSetup(store);
        tvm.log(format("setup config={}", config));
    }

    function write(string key, string content)
    external accept
    returns(bool out)
    {
        tvm.log(format("write start key={} content={}", key, content));
        out = store.set(key, content).await;
        emit onWrite(key, content, out);
        tvm.log(format("write end out={}", out ? "success": "error"));
    }

    function read(string key)
    external accept
    returns(string out)
    {
        tvm.log(format("read start key={}", key));
        out = store.get(key).await;
        emit onRead(key, out);
        tvm.log(format("read end out={}", out));
    }

    function put(string key)
    external accept
    {
        tvm.log(format("put start key={}", key));
        stash = store.get(key).await;
        emit onPut(key, stash);
        tvm.log(format("put end stash={}", stash));
    }
}
