//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract visibility{
    uint private x;
    uint public y;
    uint internal z;

    function pubFun() public pure{}
    function interFun() internal pure{}
    function extFun() external pure{}
    function preFun() private pure{}

    function callfun() external view{
        x + y + z; //can call all of them
        
        pubFun();
        interFun();
        preFun(); // can call all of them except external

        this.extFun(); // can call external inside function with this keyword
        // but this is a gas inafficient way to call this do usually we don't use this way
    }
}

// inherited function calling
// we can all function except external and private
contract child is visibility{
    function callfun2() external view{
        y + z;
        pubFun();
        interFun();
    }
}