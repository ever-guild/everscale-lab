//SPDX-License-Identifier: UNLICENSED
pragma ton-solidity >= 0.51.0;
pragma AbiHeader expire;

contract A {
    function version()
    pure
    public
    returns (uint8)
    {
        return 1;
    }

    function upgrade(TvmCell code)
    public
    {
        tvm.accept();
        tvm.setcode(code);
        tvm.setCurrentCode(code);
    }
}
