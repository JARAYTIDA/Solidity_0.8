//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

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