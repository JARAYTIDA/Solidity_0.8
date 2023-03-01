//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract TestCall{
    string public message;
    uint public x;

    event Log(string message);

    fallback() external payable {
        emit Log("fallback is called");
    }



    function foo(string memory _str, uint _x) external payable returns(bool, uint){
        message = _str;
        x = _x;
        return(true, 999);
    }
}

contract call{
    bytes public data;
    // event ev(string str);
    function callFoo(address _test) external payable {
        (bool success, bytes memory _data) = _test.call{value: 111, gas:11000}(abi.encodeWithSignature("foo(string, uint256)", "foo called", 222));
        require(success == true, "call failed");
        data = _data;
    }

    function callDoesNotExist(address _test) external{
        (bool success, ) = _test.call(abi.encodeWithSignature(""));
        require(success == true, "call failed");
        // emit ev("nahi hai madarchod");
    }
}