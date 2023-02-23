//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Constants {
    address public sender = msg.sender;
    uint public timestamp = block.timestamp;
    uint public blockNum = block.number;

    function foo() external returns(address, uint, uint) {
        sender = address(0xff);
        timestamp = 0;
        blockNum = 4000;

        return(sender, timestamp, blockNum);
    }

    function loo() external view returns(address, uint, uint){
        return (sender, timestamp, blockNum);
    }

    uint public constant ab = 234; //gas = 307
    address public constant addr = address(0x45678ffac); //378 gas
    
}
// return (condition) ? truev : 
contract non_const{
    uint public b = 234;
    address public add = address(0xff);
}

contract IfElse{
    function loop(uint x) public pure returns(uint){
        if(x<10){
            return 1;
        }
        else if(x < 20){
            return 2;
        }
        else return 3;
    }

    function loop2(uint x) public pure returns(bool){
        return x>10 ? true : false;
    }
}