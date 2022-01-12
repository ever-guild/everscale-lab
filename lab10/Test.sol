pragma ton-solidity >= 0.53.0;

contract Test {
    uint public counter1;
    uint public counter2;
    
    function f1(function() func) private {             
        func();
    }

    function addToCounter1() public {
        counter1++;
    }  

    function addToCounter2() public {
        counter2++;
    }  

    function go() public{
        tvm.accept();
        f1(addToCounter1);
        f1(addToCounter2);
    }
}