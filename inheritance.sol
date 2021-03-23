// SPDX-License-Identifier: MIT
pragma solidity ^0.7.4;

import "./ownable.sol";

// Bank inherits from contract Ownable to get functionality
// When Bank contract is deployed it will run constructor of ownable contract
// Reuse code for multiple contracts by importing it

contract Bank is Ownable {
    mapping(address => uint256) balance;

    event depositDone(uint256 amount, address indexed depositedTo);

    function deposit() public payable returns (uint256) {
        balance[msg.sender] += msg.value;
        emit depositDone(msg.value, msg.sender);
        return balance[msg.sender];
    }

    function withdraw(uint256 amount) public onlyOwner returns (uint256) {
        require(
            balance[msg.sender] >= amount,
            "Withdraw amount exceeds available funds."
        );
        balance[msg.sender] -= amount;
        msg.sender.transfer(amount);

        return balance[msg.sender];
    }

    function getBalance() public view returns (uint256) {
        return balance[msg.sender];
    }

    function transfer(address recipient, uint256 amount) public {
        require(balance[msg.sender] >= amount, "Balance not sufficient");
        require(msg.sender != recipient, "Cannot transfer funds to yourself");

        uint256 previousSenderBalance = balance[msg.sender];

        _transfer(msg.sender, recipient, amount);

        assert(balance[msg.sender] == previousSenderBalance - amount);
    }

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
     Inheritance : 
           - Parent Contract (base contract)
           - Child contract (the child inherits from the parent)
           
*/
