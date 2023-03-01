//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

library Math{
    function max(uint x, uint y) internal pure returns(uint){
        return x>=y ? x : y;
    }
}

contract TestMax{
    uint public x;
    uint public y;

    constructor (uint _x, uint _y){
        x = _x;
        y = _y;
    }

    function testmax() external view returns(uint){
        return Math.max(x,y);
    }
}

library ArrLib{
    function find(uint[] storage arr, uint x) internal view returns(uint){
        for(uint i = 0; i < arr.length; i++){
            if(arr[i] == x){
                return i;
            }
        }

        revert("element is not found");
    }
}

contract Arr{
    // one way to use library
    // uint[] public arr;

    // constructor(uint[] memory _arr) {
    //     arr = _arr;
    // }

    // function find_ele(uint i) external view returns(uint){
    //     return ArrLib.find(arr,i);
    // }

    // second way to use library
    using ArrLib for uint[];
    uint[] public arr;

    constructor(uint[] memory _arr) {
        arr = _arr;
    }

    function find(uint _i) external view returns(uint){
        return arr.find(_i);
    }
}