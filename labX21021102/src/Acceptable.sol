//SPDX-License-Identifier: UNLICENSED
pragma ton-solidity >= 0.57.3;

abstract contract Acceptable {
    constructor() public {
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
    }

    modifier accept {
        tvm.accept();
        _;
    }
}
