//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract dataLocations{
    struct MyStruct{
        uint x;
        string y;
    }

    mapping (address => MyStruct) public myStructs;

    function examples(uint[] calldata y, string calldata str) external returns(MyStruct memory){
        myStructs[msg.sender] = MyStruct({x:123, y:"this is sender"});

        MyStruct storage temp = myStructs[msg.sender];
        temp.y = "sender is changed";

        MyStruct memory tmp = myStructs[msg.sender];
        tmp.x = 345;

        _usecalldata(y);
        _usestr(str);

        return tmp;

    }

    function _usecalldata(uint[] calldata y) private pure {
        uint x = y[0];
        x = y[0] + 23;
    }

    function _usestr(string calldata st) private pure{
    }
    
}
