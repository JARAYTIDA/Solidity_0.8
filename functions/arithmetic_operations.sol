// SPDX-License-Identifier: MIT
pragma solidity^0.8.7;

contract AriOp{
    function add(uint x, uint y) external pure returns(uint){
        return x+y;
    }

    function sub(uint x, uint y) external pure returns(uint){
        return x-y;
    }

    function mul(uint x, uint y) external pure returns(uint){
        return x*y;
    }

    function div(uint x, uint y) external pure returns(uint){
        return x/y;
    }

}

contract BinaryOp{
    function and(uint x, uint y) external pure returns(uint){
        return x&y;
    }

    function or(uint x, uint y) external pure returns(uint){
        return x|y;
    }

    function xor(uint x, uint y) external pure returns(uint){
        return x^y;
    }
}

