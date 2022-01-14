//SPDX-License-Identifier: UNLICENSED
pragma ton-solidity >= 0.53.0;
pragma AbiHeader expire;

contract A {
    uint foo;

    function get() public pure responsible returns (uint8) {
        // Here maybe more complex logic
        return{value: 0, flag: 64} 41;
        // options {value: 0, flag: 64} mean returning change
    }
}
