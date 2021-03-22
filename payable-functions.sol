// SPDX-License-Identifier: MIT
pragma solidity ^0.7.4;

contract Bank {
    mapping(address => uint256) balance;

    address owner;

    event depositDone(uint256 amount, address indexed depositedTo);

    modifier onlyOwner {
        require(msg.sender == owner);
        _; // run the function
    }

    constructor() {
        owner = msg.sender;
    }

    function deposit() public payable returns (uint256) {
        balance[msg.sender] += msg.value;
        emit depositDone(msg.value, msg.sender);
        return balance[msg.sender];
    }

    function withdraw(uint256 amount) public returns (uint256) {
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
     Paybale Functions : 
            - Smart contracts can natively handle money
            - Accept money into Functions
            - Send, transfer, withdraw, keep track of money between diff addresses in ETH 
            - payable : allows people to receive money when people call it 

*/
