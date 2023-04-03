
//SPDX-License-Identifier: UNLICENSED
pragma ton-solidity >= 0.53.0;
pragma AbiHeader expire;

import "A.sol";
import "B.sol";

contract C {
    uint8 public mem;
    B public resolver;

    function make(A source, uint8 value) external {
        tvm.accept();
        mem = value;
        resolver = B(msg.sender);
        source.get{callback: C.onMake}();
    }

    function onMake(uint8 a) external {
        tvm.accept();
        resolver.resolver(mem, a);
    }
}
