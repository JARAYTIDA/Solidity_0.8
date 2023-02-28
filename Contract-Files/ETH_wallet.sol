//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract EtherWallet{
    address payable public owner;
    
    constructor(){
        owner = payable(msg.sender);
    }

    receive() external payable{}

    function withdraw(uint _amount) external {
        require(owner == msg.sender, "caller is not owner");
        // owner.transfer(_amount);
        // ways to save ether that use variables stored in memory instead or using state variables
        payable(msg.sender).transfer(_amount);

        //we can use this also
        // (bool sent,) = payable(msg.sender).call{value: _amount}("");
        // require(sent == true, "transaction failed");
    }

    function getBalance() external view returns(uint){
        return address(this).balance;
    }
}