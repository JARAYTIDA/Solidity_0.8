//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

/*
fallback or receive

    Ether is sent to contract
                |
        is my data empty ?
               / \
             yes no
             /     \
receive() exists?  fallback
         / \
       yes  no
       /     \
 receive()  fallback()  


*/



contract fallre{
    event Log(string name, address addr, uint val, bytes data);
    fallback() external payable{
        emit Log("fallback",  msg.sender, msg.value, msg.data);
    }

    receive() external payable{
        emit Log("receive", msg.sender, msg.value, "");
    }
}