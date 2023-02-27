//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

// three ways to send ether

// 1. via transfer - 2300 gas, revert
// 2. via send - 2300 gas, returns bool
// 3. via call - all gas, returns bool and data


contract sendETH{
    constructor () payable{}

    receive () external payable {}

    function sendViaTransfer(address payable _to) external payable {
        _to.transfer(123);
    }

    function sendViaSend(address payable _to) external payable{
        bool sent = _to.send(123);
        require(sent == true, "send failed");
    }

    function sendViaCall(address payable _to) external payable{
        (bool success, ) = _to.call{value: 123}("");
        require(success == true, "call failed");
    }
}

contract receiveETH{
    event Log(uint amount, uint gas);

    receive() external payable{
        emit Log(msg.value, gasleft());
    }
}