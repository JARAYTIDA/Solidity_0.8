//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract hash{
    function genHash(string memory str, uint num, address addr) external pure returns(bytes32){
        return keccak256(abi.encodePacked(str, num, addr));
    }

    function abiencode(string memory str1, string memory str2) external pure returns(bytes memory){
        return abi.encode(str1, str2);
    }

    function abiencodePacked(string memory str1, string memory str2) external pure returns(bytes memory){
        return abi.encodePacked(str1, str2);
    }

    // function collision(string memory str1, string memory str2) external pure returns(bytes32){
    //     return keccak256(abi.encodePacked(str1, str2));
    // }

    // one way to handle it is use abi encode

    function collision(string memory str1, string memory str2) external pure returns(bytes32){
        return keccak256(abi.encode(str1, str2));
    }

    //second way to use other inputs
    function collision(string memory str1, uint x, string memory str2) external pure returns(bytes32){
        return keccak256(abi.encodePacked(str1, x, str2));
    }

}

