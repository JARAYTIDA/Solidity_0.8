//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract arrays{
    uint[] public arr1 = [1,2,3,4]; //dynamic length
    uint[3] public arr2 = [10,20,30]; //fixed length

    function operationsOnArray() public {
        //push into array
        arr1.push(5); //arr1 = [1,2,3,4,5]

        //get an element
        uint x = arr1[3]; //at index 3, x = 4;

        //delete an element
        delete arr1[3]; //element at index 3 will be set to it's default value 0, arr1 = [1,2,3,0,5]

        //update array
        arr1[3] = 777;
        //pop an element
        arr1.pop(); //arr1 = [1,2,3,777]

        //get length
        uint len = arr1.length; // len = 4

        //create new array in memory
        //array in memory must a fixed size array
        // we won't be able to use push and pop for these arryas
        uint[] memory a = new uint[](5); 
    }

    function returnArray() public view returns(uint[] memory){
        return arr1;
    }
}