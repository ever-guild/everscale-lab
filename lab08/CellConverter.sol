pragma ton-solidity >= 0.53.0;

contract CellConverter{
    struct A{
        uint i;
    }

    function structToCell(A a) public returns (TvmCell){
        TvmBuilder b;
        b.store(a);
        return b.toCell();      
    }

    function cellToStruct(TvmCell c) public returns(A){
       TvmSlice s = c.toSlice();
       (A a) = s.decode(A);
       return a;
    }

    function stringToCell(string s) public returns (TvmCell){
        TvmBuilder b;
        b.store(s);
        return b.toCell();        
    }    

    function cellToString(TvmCell c) public returns (string){
       TvmSlice s = c.toSlice();
       (string str) = s.decode(string);
       return str;
    }
}