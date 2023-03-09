//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract piggyBank{

    address payable owner;
    uint public totalAmount;

    constructor () {
        owner = payable(msg.sender);
        totalAmount = 0;
    }

    receive() external payable {
        totalAmount += msg.value;
    }

    function collectMoney(uint amount) external {
        require(owner == msg.sender, "sender is not owner");
        payable(msg.sender).transfer(amount);

        // return totalAmount;
    }
}