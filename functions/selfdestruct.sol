//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract KILL{
    constructor () payable {}

    function kill() external {
        selfdestruct(payable(msg.sender));
    }

    function VAL() external pure returns(uint){
        return 123;
    }

}

contract helper{
    function getBlanace() external view returns(uint){
        return address(this).balance;
    }

    function kill (KILL _kill) external {
        _kill.kill();
    }
}