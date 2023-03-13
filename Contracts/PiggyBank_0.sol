//SPDX-License-Identifier: MIT

pragma solidity ^0.8;

contract piggyBank{
    event Withdraw(uint amount);
    event deposit(uint amount);

    address public owner = msg.sender;

    receive () external payable {
        emit deposit(msg.value);
    }

    function withdraw() external {
        require(owner == msg.sender, "not owner");
        emit Withdraw(address(this).balance);
        selfdestruct(payable(msg.sender));
    }
}