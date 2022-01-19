pragma ton-solidity >= 0.54.0;

import "Dummy1.sol";
import "Dummy2.sol";

contract SimpleDeployer {

  TvmCell _code;

  // Set deployed contract code
  function setCode(TvmCell code) public {
    tvm.accept();
    _code = code;
  }

  // Deploy via new
  function deploy() public returns (address) {
    tvm.accept();
    address _addr = new Dummy1{
      value: 1e9,
      code: _code,
      bounce: true}
      ();
    return _addr;
  }

  // Deploy via transfer
  function deployWithTransfer() public returns (address){
    tvm.accept();
    TvmCell stateinit = tvm.buildStateInit(
        {
        code: _code
        });
    address _addr = address.makeAddrStd(0, tvm.hash(stateinit));
    TvmCell body = tvm.encodeBody(Dummy2);
    _addr.transfer({value: 1e9, body: body, stateInit: stateinit});
    return _addr;
  }
}