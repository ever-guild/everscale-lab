//SPDX-License-Identifier: UNLICENSED
pragma ton-solidity >= 0.57.3;

import "Acceptable.sol";
import "IStore.sol";

contract Store is Acceptable, IStore {
    mapping (uint => TvmCell) data;

    function get(uint key)
    external view responsible override accept returns (optional(TvmCell) value) {
        value = data.fetch(key);
    }

    function set(uint key, TvmCell value)
    external responsible override accept returns (bool status) {
        status = data.add(key, value);
    }
}
