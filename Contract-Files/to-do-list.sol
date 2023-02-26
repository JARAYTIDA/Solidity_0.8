//SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract toDos{
    struct todo{
        string str;
        bool completed;
    }

    todo[] public list;

    function create(string calldata _str) external {
        list.push(todo({str:_str, completed:false}));
    }

    function set(uint _index, string calldata _str) external {
        list[_index].str = _str;
/*

here we only have to call list[_index] one time that's why we are using this.

istead of this we could also use {
    todo temp = list[_index];
    temp.str = _str;
}

but this will use more gas for one time;


but if we are calling more time than one that we must use second method because
list[_index] will be called many times and this will consume more gas than second \
method

*/
    
    }

    function get(uint _index) external view returns(string memory, bool){
        //using storage will reduce gas count than using memory. it avoids making copy of the element
        todo storage ele = list[_index];
        return (ele.str, ele.completed);
    }

    function toggleCompleted(uint _index) external {
        list[_index].completed = !list[_index].completed;
    }
}