// SPDX-License-Identifier: MIT
pragma solidity ^0.7.4;

/*
    Mappings: >> Key-Value Storage
    
        - One of the most used data structures in Solidity overall
        - Mappings are Key-Value Storage or a key-value data type (like dictionaries)
        - You define a key and directly get a value
        - One way street, it's possible to go from a key to a value but not vice versa
        
        - ie. Balance mapping in Solidity :
              - Where you create a token in a smart contract and want to keep track of everyones balances
              - So that if you have your address you can very quickly get your balance 
              - If you input your address into the mapping, the mappping will give the balance back
              - Can create a structure where you have a lot of diff keys and you assign a value
              - Can input the key and always get the value back
              
        - Mappings are defined as follows :
              - Mapping(keyType => valueType)name
              - Mapping(address => uint)
              - Assign a value to a key : balance[address] = 10

*/

contract Bank {
    mapping(address => uint256) balance;

    function addBalance(uint256 _toAdd) public returns (uint256) {
        // balance[msg.sender] = balance[msg.sender] + _toAdd;
        balance[msg.sender] += _toAdd; // updated balance
        return balance[msg.sender];
    }

    function getBalance() public view returns (uint256) {
        return balance[msg.sender];
    }
}

// Deploy Bank Smart Contract :

// addBalance : 1000
// getBalance : 1000
// decoded output : { "0": "uint256: 1000" }
