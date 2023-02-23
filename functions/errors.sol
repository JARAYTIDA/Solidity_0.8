//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ErrorsInSol{
    function testRequire(uint x) external pure returns(string memory){
        require( x<=10, "x > 10");
        //code
        string memory str = "given number is less then or equal to 10";
        return str;
    }

    function testRevert(uint x) external pure returns(string memory){
        if(x > 10)
            revert("x>10");
        //code
        string memory str = "given number is less then or equal to 10";
        return str;
    }

    uint public num = 10;
    function testAssert() external view {
        assert(num == 10);
    }

    function incr() external {
        num += 1;
    }

    function dec() external{
        num -= 1;
    }
}