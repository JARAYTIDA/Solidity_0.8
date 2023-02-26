//SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract Event{
    event Log(string message, uint val);
    // up to 3 paramaeters can be indexed in event
    event IndexedLog(address indexed sender, uint val);
    function useev() external{
        emit Log("madarchod", 786);
        emit IndexedLog(msg.sender, 786);
    }

    event Message(address indexed _from, address indexed _to, string val);

    function send(address _to, string calldata _str) external {
        emit Message(msg.sender, _to, _str);
    }

    // returns(uint, string memory)
}