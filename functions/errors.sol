//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ErrorsInSol{
    function err(uint x) external pure returns(string memory){
        require( x<=10, "x>10");
        //code
        string memory str = "given number is less then or equal to 10";
        return str;
    }
}