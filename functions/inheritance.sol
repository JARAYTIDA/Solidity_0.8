  //SPDX-License-Identifier: MIT

  pragma solidity ^0.8.3;

  contract A{
      function foo() external virtual pure returns(string memory){
          return "A";
      }
      function bar() external pure virtual returns(string memory){
        return "A";
      }
      function faz() external pure returns(string memory){
          return "A";
      }
  }

  contract B is A{
      function foo() external pure virtual override returns(string memory){
          return "B";
      }

      function bar() external pure override returns(string memory){
          return "B";
      }
  }

  contract C is B{
      function foo() external pure override returns(string memory){
          return "C";
      }
  }