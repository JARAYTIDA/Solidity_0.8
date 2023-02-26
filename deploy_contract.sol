//SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract TestContract1{
    address public owner = msg.sender;
    function setOwner(address _addr) public {
        require(_addr != address(0), "not valid user");
        owner = _addr;
    }
}

contract TestContract2{
    address public owner = msg.sender;
    uint public val = msg.value;
    uint public x;
    uint public y;

    constructor(uint _x, uint _y) payable{
        x = _x;
        y = _y;
    }
}

contract Proxy{
    event Deploy(address);

    fallback() external payable{} 

    function deploy(bytes memory _code) external payable returns(address addr){
        assembly{
            //create (v,p,n)
            // v amount of ether to send
            // p pointer in memory to start of code
            // n size of the code
            addr := create(callvalue(), add(_code, 0x20), mload(_code))
        }
        require(addr != address(0), "delpoy falied");

        emit Deploy(addr);
    }

    function execute(address _target, bytes memory _data) external payable{
        (bool success, ) = _target.call{value: msg.value}(_data);
        require(success, "failed");
    }
}

contract Helper{
    function getByteCode1() external pure returns(bytes memory){
        bytes memory bytecode = type(TestContract1).creationCode;
        return bytecode;
    }

    function getByteCode2(uint _x, uint _y) external pure returns(bytes memory){
        bytes memory bytecode = type(TestContract2).creationCode;
        return abi.encodePacked(bytecode, abi.encode(_x, _y));
    }

    function getCallData(address _owner) external pure returns(bytes memory){
        return abi.encodeWithSignature("setOwner(address)", _owner);
    }
}