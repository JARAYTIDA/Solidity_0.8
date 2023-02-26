//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

/*
two methods of calling a parent function

 - direct
 - super

    E
  /   \
 F     G
  \   /
    H

*/


contract E{
    event Log(string message);
    function foo() public virtual {
        emit Log("E.foo");
    }

    function bar() public virtual {
        emit Log("E.bar");
    }
}

contract F is E{
    function foo() public virtual override{
        emit Log("F.foo");
        E.foo(); //direct
    }

    function bar() public virtual override{
        emit Log("F.bar");
        super.bar(); //super
    }
}

contract G is E{
    function foo() public virtual override{
        emit Log("G.foo");
        E.foo(); //direct
    }

    function bar() public virtual override{
        emit Log("G.bar");
        super.bar(); //super
    }
}

contract H is F,G{
    function foo() public override(F,G){
        F.foo(); // call only for F
    }

    function bar() public override(F,G){
        super.foo(); // call for all the parents
    }
}