//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract loop{
    // writing sum till n with the help of for and while
    function forLoop(uint x) external pure returns(uint){
        uint ans = 0;
        for(uint i = 1; i<=x; i++){
            ans += i;
        }

        return ans;
    }

    function whileLoop(uint x) external pure returns(uint){
        uint ans = 0;
        while( x > 0 ){
            ans += x;
            x--;
        }

        return ans;
    }

}