//SPDX-License-Identifier: UNLICENSED
pragma ton-solidity >= 0.57.3;

import "Acceptable.sol";
import "IStore.sol";

contract Store is Acceptable, IStore {
    mapping(string => string) data;

    function get(string key)
    external view responsible override
    returns (string value) {
        if (data.exists(key)) value = data.at(key);
    }

    function set(string key, string value)
    external responsible override accept
    returns (bool status) {
        if (data.exists(key)) status = data.replace(key, value);
        else status = data.add(key, value);
    }
}
