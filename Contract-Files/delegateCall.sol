//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract TestDelegateCall0{
    uint public x;
    address public sender;
    uint public value;

    function setAll(uint _x) external payable{
        x = 2*_x;
        sender = msg.sender;
        value = msg.value;
    }
}

contract TestDelegateCall1{
    uint public owner;
    uint public x;
    address public sender;
    uint public value;

    function setAll(uint _x) external payable{
        x = 2*_x;
        sender = msg.sender;
        value = msg.value;
    }
}

contract TestDelegateCall2{
    uint public x;
    address public sender;
    uint public value;
    uint public owner;

    function setAll(uint _x) external payable{
        x = 2*_x;
        sender = msg.sender;
        value = msg.value;
    }
}

contract DelegateCall{
    uint public x1;
    address public sender1;
    uint public value1;
    //these values should be in same order which is present in TestDelegateCall contract
    //otherwise changed values will be different and random

    // one way to call delegate call
    // function test(address _test, uint _x) external payable{
    //     (bool success, bytes memory data) = _test.delegatecall(abi.encodeWithSignature("setAll(uint256)", _x));
    //     require(success, "delegetcall failed");
    // }

    //other way to call delegatecall

    function test(address _test, uint _x) external payable{
        (bool success, bytes memory data) = _test.delegatecall(abi.encodeWithSelector(TestDelegateCall0.setAll.selector, _x));
        require(success, "delegatecall failed");
    }
}

contract Call{
    uint public x1;
    address public sender1;
    uint public value1;
    

    function test(address _test, uint _x) external payable{
        (bool success, bytes memory data) = _test.call(abi.encodeWithSignature("setAll(uint256)", _x));
        require(success, "call failed");
        x1 = _x;
        sender1 = msg.sender;
        value1 = msg.value;
    }
}