// SPDX-License-Identifier: MIT
pragma solidity ^0.7.4;

// constructor : A function that is used to inilaize the contract and...
//               is used only ONCE at the time the contract is deployed and cannot be run again

contract HelloWorld {
    // contratcs need to be initialzed to a certain state in order to begin to be able to operate
    // can initialze diff state variables in contact scope
    // state variables preserve the state of the contract.
    // string message declared in contract scope w/o initialzed value

    string message; // value of _message

    // input agruments in constructor that can be used to initialize string state variable
    // code in constructor block will run when conract is created
    //  _message will set value inside constructor of the message at the contract level
    // returns string message value
    constructor(string memory _message) {
        message = _message;
    }

    function hello() public view returns (string memory) {
        // local variables : only exisit in the function scope
        return message;
    }
}
