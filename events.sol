// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract Bank {
    mapping(address => uint256) balance;

    address owner;

    event balanceAdded(uint256 amount, address depositedTo);

    modifier onlyOwner {
        require(msg.sender == owner);
        _; // run the function
    }

    constructor() {
        owner = msg.sender;
    }

    function addBalance(uint256 _toAdd) public onlyOwner returns (uint256) {
        balance[msg.sender] += _toAdd;
        emit balanceAdded(_toAdd, msg.sender);
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

    Events : - A way for us to log events/d log data that happens during our function 
            - The EVM can save logs, and within that log structure we can save events
            - An event log of what's happened in our contract
            - Public events for when specific actions happen in our smart contract
        
*/
