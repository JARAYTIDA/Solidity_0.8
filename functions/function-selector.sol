// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract select{
    function get(string calldata _func) external pure returns(bytes4){
        return bytes4(keccak256(bytes(_func)));
    }
}

contract data{
    event Log(bytes data);
    function getData(address one ) external {
        emit Log(msg.data);
    }
}

