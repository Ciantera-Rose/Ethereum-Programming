// SPDX-License-Identifier: MIT
pragma solidity ^0.7.4;

import "./ownable.sol";

// Bank inherits from contract Ownable to get functionality
// When Bank contract is deployed it will run constructor of ownable contract
// Reuse code for multiple contracts by importing it

interface GovernmentInterface {
    function addTransaction(
        address _from,
        address _to,
        uint256 _amount
    ) external;
}

contract Bank is Ownable {
    GovernmentInterface governmentInstance =
        GovernmentInterface(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);

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

    function getOwner() public view returns (address) {
        return owner;
    }

    function transfer(address recipient, uint256 amount) public {
        require(balance[msg.sender] >= amount, "Balance not sufficient");
        require(msg.sender != recipient, "Cannot transfer funds to yourself");

        uint256 previousSenderBalance = balance[msg.sender];

        _transfer(msg.sender, recipient, amount);

        governmentInstance.addTransaction(msg.sender, recipient, amount);

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
           - Reduces code duplication
           - Creates clear code structure
           
           - Internal visibility level : 
               - public : function/variaable is available for anyone to query or execute
               - private : function/variable can only be executed from within the contract itself
               
               - internal : -cannot access it from outside contract environment
                            -can be accessed from any contract that is inheriting from 
                            
      External Contracts : - a contract that is deployed to the blockchain that is completely
                              separate from ours

*/
