// SPDX-License-Identifier: MIT
pragma solidity ^0.7.4;

contract Ownable {
    address public owner;

    modifier onlyOwner {
        require(msg.sender == owner);
        _; // run the function;
    }

    constructor() {
        owner = msg.sender;
    }
}
