// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract Inbox {
    string public message;

    constructor(string memory _initialMessage) {
        message = _initialMessage;
    }

    function setMessage(string memory _newMessage) public {
        message = _newMessage;
    }

    function doMath(int256 a, int256 b) public pure {
        a + b; // each operation costs a diff amount of gas
        b - a;
        a * b;
        a == 0;
    }
}

/*
Units of measurement : 

USD $1.00 = 100 cents 

1 Ether = 1,000,000,000,000,000,000 (18 zeros) wei
1 Ether = 1,000,000,000 (9 zeros) gwei
1 Ether = 1,000 finney

*/

/*
    Gas : Meant to measure how much work we are executing with our code
          Anytime we send a transaction to the Ethereum network there 
          is some amount of gas price attached to it

   gasPrice : Amount of Wei the sender is willing to pay per unit gas to get this transaction processed
   
   startGas/gasLimit : Units of gas that this transaction can consume
   
   

*/
