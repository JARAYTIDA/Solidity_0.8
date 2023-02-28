//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract callTestContract{
    function setX(TestContract _test, uint _x) external{
        _test.setX(_x);
    }
/*
    another way to do this

    function setX(address _test, uint _x) external{
        TestContract(_test).setX(_x);
    }

*/


    function getX(address _test) external view returns(uint){
        return TestContract(_test).getX();
    }

    function setXansSendEther(address _test, uint _x) external payable{
        TestContract(_test).setXansReceiveEther{value : msg.value}(_x);
    }

    function getXandValue(address _test) external view returns(uint, uint){
        // (_x, value) = TestContract(_test).getXandValue(); alsowrite in this way
        return TestContract(_test).getXandValue();
    }
}

contract TestContract{
    uint public x;
    uint public value = 124;

    function setX(uint _x) external{
        x = _x;
    }

    function getX() external view returns(uint){
        return x;
    }

    function setXansReceiveEther(uint _x) external payable{
        x = _x;
        value = msg.value;
    }

    function getXandValue() external view returns(uint, uint){
        return (x, value);
    }
}