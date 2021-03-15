// SPDX-License-Identifier: MIT
pragma solidity ^0.7.4;

contract HelloWorld {
    // state variables
    string message;

    constructor(string memory _message) {
        message = _message;
    }

    function hello() public view returns (string memory) {
        return message;
    }
    // ie;
    // function hello() public pure returns (string memory) {
    //     return 'hello world;
    // }
}

/*
 -  pure keyword lets the solidity complier know that this function does not 
    interact with anything else outside of the function at all

-   view keyword does not have as strict conditions on it
    it can interact with state variables (read them) but it is
    not allowed to change any state variables

-   can also have no keyword in functions at all
*/
