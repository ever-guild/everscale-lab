//SPDX-License-Identifier: UNLICENSED
pragma ton-solidity >= 0.57.3;

interface IStore {
    function get(string key) external view responsible returns (string value);
    function set(string key, string value) external responsible returns (bool status);
}
