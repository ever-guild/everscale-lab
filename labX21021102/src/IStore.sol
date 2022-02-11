//SPDX-License-Identifier: UNLICENSED
pragma ton-solidity >= 0.57.3;

interface IStore {
    function get(uint key) external view responsible returns (optional(TvmCell) value);
    function set(uint key, TvmCell value) external responsible returns (bool status);
}
