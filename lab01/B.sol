//SPDX-License-Identifier: UNLICENSED
pragma ton-solidity >= 0.51.0;
pragma AbiHeader expire;

contract B {
    string public doc;

    function add(string content)
    public
    {
        tvm.accept();
        doc = content;
    }
}
