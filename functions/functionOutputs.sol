//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract FunctionOutputs{
    function returnMany() public pure returns(uint, bool){
        return(100, true);
    }

    function named() public pure returns(uint x, bool b){
        return(100, true);
    }

    function assigned() public pure returns(uint x, bool b){
        x = 100;
        b = true;
    }
    // assigning variables equal to output to the outher function
    function takeOut() public pure{
        (uint x, bool b) = returnMany();
        //only wnat to use bool
        ( , bool c) = returnMany();
    }
}