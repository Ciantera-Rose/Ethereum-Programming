// SPDX-License-Identifier: MIT
pragma solidity ^0.7.4;

// Variables can be declared globally in the contract context, outside of any function and is avaiable to use
// anywhere in the contract.

contract HelloWorld {
    string message = "Hello World";

    function hello() public returns (string memory) {
        return message;
    }
}

// Can declare variables inside of functions and it will only be avaiable inside of the
// When you declare a string var inside a function you need to set its data location to memory

contract HelloWorld {
    function hello() public returns (string memory) {
        string memory message = "Hello World";
        return message;
    }
}
