// SPDX-License-Identifier: MIT
pragma solidity ^0.7.4;

// Private Function use case :

contract Bank {
    mapping(address => uint256) balance;

    function addBalance(uint256 _toAdd) public returns (uint256) {
        balance[msg.sender] += _toAdd; // updatesd balance
        return balance[msg.sender];
    }

    function getBalance() public view returns (uint256) {
        return balance[msg.sender];
    }

    // send funds to another account
    function transfer(address recipient, uint256 amount) public {
        // check balance of msg.sender (error handle)

        _transfer(msg.sender, recipient, amount);

        // event logs and further checks
    }

    // private function that handles acutal transfer
    // (can reuse this function is other functions that require transfer logic)
    function _transfer(
        address from,
        address to,
        uint256 amount
    ) private {
        balance[from] -= amount;
        balance[to] += amount;
    }
}

/*
Visibility : Who can query a function in a contract ...

    - Is a way for us to restrict acces to functions and state variables in our smart contract
      so we can specify from where our function should be able to be executed from
      
    - Public : Everyone >> Anyone can execute the function or anyone can access our variable
               Open Visibility with no restrictions
               
    - Private : This function will only be able to be executed from within the function / contract itself
                A function that executes another function from within the contract
                The private function is usually executed by some other public function 
                (helper function to another function)
    
    - External : Only able to be executed from other contracts (not our own contract)
                 Used to restrict functionality
    
    - Internal : Private and contracts derving from it. Can only be accessed/executed from a function within the
                 contract or any contract that actually inherhits from the contract where the function is defined. 
                 (Inheritance)

*/
