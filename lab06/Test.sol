pragma ton-solidity >= 0.53.0;

contract Test {
    mapping (uint=>address) public chunksList;    

    string public m_chunk;
    uint static chunkNum;

    constructor(string chunk) public {
        tvm.accept();
        m_chunk = chunk;
    }

    function add(string s, uint chunk) public {
        tvm.accept(); 
        address addr = new Test{
            value: 0.145 ever,
            code: tvm.code(),
            varInit: {
                chunkNum: chunk
            }
        }(s);     
        chunksList[chunk] = addr;
    }
}