//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

// first deploy this contract

// contract Counter{
//     uint public cnt;

//     function inc() external {
//         cnt++;
//     }
//     function dec() external {
//         cnt--;
//     }
// }

// one method to use this contract is this if it is in the same file
// contract callInterface{
//     function examples(address _counter) external {
//         Counter(_counter).inc();
//     }
// }

// but if we want to use it from other contract deployed on mainnet the we'll use interfacing
// and then deploy this contract 
// learn to use INterfacing

interface Icounter{
    function cnt() external view returns(uint);
    function inc() external ;
}

contract callInterface{
    uint public ct;
    function example(address _counter) external {
        Icounter(_counter).inc();
        ct = Icounter(_counter).cnt();
    }
}