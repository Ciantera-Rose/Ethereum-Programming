//SPDX-License-Identifier: MIT
pragma solidity ^0.7.5;

contract bank {
    //UNSAFE

    mapping(address => uint256) balance;

    function withdraw() public {
        require(balance[msg.sender] > 0); // CHECKS
        msg.sender.send(balance[msg.sender]); // INTERACTIONS
        balance[msg.sender] = 0; // EFFECTS
    }
}

// ie: attack.add()

contract attack {
    function start() public {
        // deposit funds to bank
        // call to withdraw();
    }

    // Calls with no data (w/ value attached)
    // used with transfer, send or empty.call
    // fallback function after ^0.0.6
    // called automatically when we get a transfer or an empty call w/ a transfer
    receive() external payable {
        // new call to withdraw
    }

    // Will execute when no other function matches
    // if someone sends an empty call with value and no recieve function this will run (as long as payable)
    fallback() external payable {}
}
