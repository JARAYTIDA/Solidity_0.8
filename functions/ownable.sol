//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ownable{
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "not owner");
        _;
    }

    function newOwner(address _x) external onlyOwner{
        require(_x != address(0), "invalid user");
        owner = _x;
    }

    function onlyOwnerCanCall() external onlyOwner{
        //code
    }

    function anyoneCanCall() external{
        //code
    }
}