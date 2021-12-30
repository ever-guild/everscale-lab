pragma ton-solidity >= 0.53.0;

contract T {       
    function trnsf(address dest) public {
        tvm.setGasLimit(5521);
        dest.transfer(1e8);
    }
}
