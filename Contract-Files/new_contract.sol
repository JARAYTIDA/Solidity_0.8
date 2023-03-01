//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Account{
    address public bank;
    address public owner;

    constructor(address _owner) payable{
        bank = msg.sender;
        owner = _owner;
    }

    function getBack() public{
        require(msg.sender == owner, "kasjdhf");
        payable(owner).transfer(address(this).balance);
    }
}

contract AccountsFactory{
    Account[] public accounts;

    // function createNewAccount(address _owner) external payable{
    //     Account account = new Account(_owner);
    //     accounts.push(account);
    // }
    // ether will stay in this contract's account only

    function createNewAccount(address _owner) external payable{
        Account account = new Account{value: msg.value}(_owner);
        accounts.push(account);
    }
    // now it will transfer all the msg value to _owner's contract


    function checkBal(address _addr) external view returns(uint){
        return _addr.balance;
    }

}
