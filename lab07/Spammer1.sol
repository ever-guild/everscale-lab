pragma ton-solidity >= 0.53.0;
interface ISpammer {
    function start(string s, address a) external;
}
contract Spammer1{  
    function start(string s, address a) public{
        tvm.accept();
        ISpammer(a).start{value: 1 ever, bounce: true}(s, this);        
    }    
}