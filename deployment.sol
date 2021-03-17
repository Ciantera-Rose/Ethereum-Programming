// SPDX-License-Identifier: MIT
pragma solidity ^0.7.4;

contract Inbox {
    string public message;
    
 constructor(string memory _initialMessage) public {
        message = _initialMessage;
    }
    
    function setMessage(string memory _newMessage) public {
        message = _newMessage; // changes the blockchain
    }
    
    // function getMessage() public view returns (string memory) {
    //     return message; Doesn't change anything
    // }
}


// Common Function Types (function type declarations) : 
/* Can only use one keyword per function:

    - public : Anoyone with an ethereum account can access contract and call this function
    - private : Only this contract's code can call this function
    - view : This function returns data and does not modify the contracts data.
             Does not modify message var, just accesses it.
    - constant : Same as view. This function returns data and does not modify the contract's data
    - pure : Function will not modify or even read the contract's data 
    - payable : When someone calls this function they might send either along
    
    Note: returns keyword :
        - returns is used to specify the type of return value we expect to see back from a functiom
        - A function that modifies the state of a contract will not return any values
        - So returns will only be used of functions with view or constant
          
   Note: Solidity Gotchaa : 
        - Whenever you define a stroage variable, if you mark that variable with the public keyword
          then your function is going to automatically create a new function for you. That function
          will have the exact same name as your variable. If you call that function it will return 
          the variable itself. Does the work of the getMessage function for free and allows us to
          access the value of message.
    
*/

/*
     Behind the scenes:
        - What really happens on the Ethereum network when we try to deploy or create and instance 
          of a contract...
       
        - When we create a new contract it's very similar to the transfer of money between two parties 
        - When we want to send money from one person to another it will authorize a new transaction and the 
          transaction will have the purpose of trying to create new contract. And we send that from our account 
          over to some specific network that attepmts to create the contract.
        - External Account TO Create Contract Transaction : 
            - To Field: 
                - The big difference between a money sending transaction and a contract creation trasnaction is 
                  the "to" field is left BLANK. Meaning we are attempting to create a new contract
            - Data Property: 
                - Compiled byte code of the contract. The code that comes out of the Solidity complier is sent
                  in and stored on the network. Specifically the code gets stored in the account that's created 
                  that represents our actual contract.
        
/*
