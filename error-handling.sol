// SPDX-License-Identifier: MIT
pragma solidity ^0.7.4;

// Require() :

contract Bank {
    mapping(address => uint256) balance;
    address owner;

    constructor() {
        owner = msg.sender;
    }

    function addBalance(uint256 _toAdd) public returns (uint256) {
        require(msg.sender == owner); // only account owner can add balance
        balance[msg.sender] += _toAdd; // updatesd balance
        return balance[msg.sender];
    }

    function getBalance() public view returns (uint256) {
        return balance[msg.sender];
    }

    // send funds to another account
    function transfer(address recipient, uint256 amount) public {
        require(balance[msg.sender] >= amount);
        require(msg.sender != recipient);

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

// If you attempt to transfer money that you do not have it will throw a Revert error
// and refund remaining gas fees.

// require() :
// addBalance : 300
// transfer : 100
// getBalance : decoded output : { "0": "uint256: 200" }

/*

    ERROR HANDLING : 
    
        - require() : - This function is here to help us check for valid conditions. If not
                        true this function will throw an error and stop function execution completely
                      - Checks inputs : (are inputs we entered within bounds we have set to be correct)
                      - Also used for administrative actions (restrict who can do what)
                      
        - Revert :    - If require statement fails it will call a low level operation called "Revert"
                        Revert will revert the transaction (it will be like nothing happened and there
                        will be no execution in the contract) It will then refund the remaining gas.
                                 
        - require ie :  require(inputNumber > 0);
                        require(msg.sender == owner)
                        
                        
        - assert() : - Should only throw an error if there is an actual internal error in our contract
                     - If code is correct assert should never fire
                     - TEST for internal errors and only throw if internal error is in our code
                     - Check invariants (validates that is actua;ly the case)
                    
        Invariants : - A concept
                     - A condition that is always true at a particular point in our code


*/
