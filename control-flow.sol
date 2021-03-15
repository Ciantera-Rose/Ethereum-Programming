// SPDX-License-Identifier: MIT
pragma solidity ^0.7.4;

// All contratcs tested / deployed in remix ethereum IDE

contract HelloWorld {
    string message;

    constructor(string memory _message) {
        message = _message;
    }

    function hello() public view returns (string memory) {
        if (msg.sender == 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4) {
            return message;
        } else {
            return "wrong address";
        }
    }
}

// Control Flow : if / else statements
// if / else statements function the same in Solidity as they do in Javascript

/* Operators : Modify and Compare 2 values (similar to Javascript)

Operators:

bool: The possible values are constants true and false.
! (logical negation)
&& (logical conjunction, “and”)
|| (logical disjunction, “or”)
== (equality)
!= (inequality)

int / uint
Comparisons: <=, <, ==, !=, >=, > (evaluate to bool)
Bit operators: &, |, ^ (bitwise exclusive or), ~ (bitwise negation)
Shift operators: << (left shift), >> (right shift)
Arithmetic operators: +, -, unary -, *, /, % (modulo), ** (exponentiation)


 DOCS :
 -  Types : 
    https://docs.soliditylang.org/en/v0.7.5/types.html 

 - Order of Precedence of Operators :
    https://docs.soliditylang.org/en/v0.7.5/cheatsheet.html#order 
*/

// Note: memory keyword is not needed for integers

/* 

   Special variables in Solidity that are defined automatically without us doing anything:
   these variables are primarialy related to the Ethereum blockchain and the tx that is being executed
   when we are in a function
   
   msg.sender : Will always be defined in the function. Eth address of the sender of a transaction
                Whoever is calling the function, msg.sender will contain their address
                
                msg.sender == 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
                
                When we keep track of depositied funds, we need to know who owns a certain amount of funds
                or how many tokens do you own so that when you withdraw tokens you can withdraw the right amount.
                This is done by keeping the balance and then checking with msg.sender whenever you call the contract
                  
   msg.value : This will contain the value of the transaction if someone called your function
               with an amount of Ether
               
*/
