//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Immutable{
    // 52569gas without immutable
    // address public owner = msg.sender;
    // 50116gas with immutable
    address public immutable owner;
    constructor(){
        owner = msg.sender;
    }
    uint public x;
    function foo() external {
        require(owner == msg.sender, "not valid");
        x += 1;
    }
}