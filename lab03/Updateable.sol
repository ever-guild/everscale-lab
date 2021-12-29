pragma ton-solidity >= 0.53.0;

contract Updateable {
    function cleaner() public{
        tvm.accept();
        selfdestruct(address(this));
    }

    function cleaner2() public{
        tvm.accept();
        address(this).transfer(0, false, 128+32);
    }   
}