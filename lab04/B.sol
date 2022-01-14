//SPDX-License-Identifier: UNLICENSED
pragma ton-solidity >= 0.53.0;
pragma AbiHeader expire;

import "A.sol";
import "C.sol";

contract B {
    A public source;
    C public clojure;
    uint8 public result;

    constructor(A a, C c) public {
        tvm.accept();
        source = a;
        clojure = c;
    }

    function some(uint8 foo) external view {
        tvm.accept();
        clojure.make(source, foo);
    }

    function resolver(uint8 c, uint8 a) external {
        tvm.accept();
        // Here maybe more complex logic
        result = c + a;
    }
}
