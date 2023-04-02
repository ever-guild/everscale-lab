pragma ton-solidity >= 0.53.0;

contract D {
    function destructor1() public {
        tvm.accept();
        selfdestruct(address(this));
    }

    function destructor2() public {
        tvm.accept();
        address(this).transfer(0, false, 128+32);
    }   
} 