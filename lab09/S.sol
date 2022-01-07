pragma ton-solidity >= 0.53.0;

contract S{
    struct A{
        uint ui;
        string text;       
    }
    function structReceiver(A a) public returns(A){
        tvm.accept();
        return a;
    }
}