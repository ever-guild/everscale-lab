//SPDX-License-Identifier: UNLICENSED
pragma ton-solidity >= 0.51.0;
pragma AbiHeader expire;

import "B.sol";

contract A {
    function addToB(address addr, string content)
    public
    pure
    {
        tvm.accept();
        B(addr).add(content);
    }
}
