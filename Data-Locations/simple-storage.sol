//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract getset{
    string str;

    // calldata gas = 51385 ; 343327
    // memory gas = 51923 ; 388744
    function set(string calldata _str) external{
        str = _str;
    }

    function get() external view returns(string memory){
        return str;
    }
}