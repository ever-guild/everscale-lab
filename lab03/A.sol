//SPDX-License-Identifier: UNLICENSED
pragma ton-solidity >= 0.53.0;
pragma AbiHeader expire;

contract A {
    function getSum(int a, int b) internal pure returns (int) {
        return a + b;
    }

    function getSub(int a, int b) internal pure returns (int) {
        return a - b;
    }

    function router(uint8 mode) internal returns (function (int, int) returns (int)) {
        function (int, int) returns (int) func;
        if (mode == 0) {
            func = getSum;
        } else if (mode == 1) {
            func = getSub;
        }
        return func; // if `func` isn't initialized then exception is thrown
    }

    function process(int a, int b, uint8 mode) public returns (int) {
        return router(mode)(a, b);
    }
}
