// SPDX-License-Identifier: MIT
pragma solidity 0.7.5;

// Write a function is solidity and return HelloWorld
// To get a response from the contract we need to write functions that return a statement

// Function declaration :
// public : The function can be called from anywhere and is accessible for anyone both
//           inside and outside of the smart contract

// pure : Tells the complier that this function will NOT interact with any other part of the smart contract
//        Returns a string, must be written with "memory". Can then define function logic inside block

// Contract Header and function header do NOT need semicolon but all other code in Solidity does need a semicolon

contract HelloWorld {
    function hello() public pure returns (string memory) {
        return "Hello World";
    }
}
