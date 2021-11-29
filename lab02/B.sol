//SPDX-License-Identifier: UNLICENSED
pragma ton-solidity >= 0.51.0;
pragma AbiHeader expire;

contract B {
    function version()
    pure
    public
    returns (uint8)
    {
        return 2;
    }
}
