//SPDX-License-Identifier: MIT
pragma solidity ^0.7.5;
import "SafeMath.sol";

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

/*
    Overflow & Underflow : Unexpected behavior when adding and subtracting numbers
    
    unsigned intergers : An int that can only be positive
    signed integers : can be both neg and positive
    
    uint 8 : 8 bits of size to this integer (8 bits = 1 byte)
    Max number that can be written with 8 bits is 255
    Finite in size, bigger numbers cannot fit into this variable

OverFlow: An integer of finite size is overflowing and goes back to 0
    uint8 n = 255
    n = n + 1 >> 0 >> n will have a value of 0 b/c it surpasses maximum size by 1
    n = n + 2 >> 1
    
    uint8 n = 0
    n = n - 1 >> 255
    n = n - 2  >> 254
    
    
    - Why are binanry numbers limited in this way :
    - uint8 has room for 8 1s and 0s bc computers are binanry
    - smallest possible # we can write with 8 bits = 00000000
    - biggers possible # we can write with 8 bits  = 11111111
    
    - 2^8 - 1 = 255
    - 11111111 + 1  (adding another 1 resets everything to 0)
    - resets to 0
    
    bits take up space so be aware of how much space you need
    
*/

contract underflow {
    using SafeMath for uint256;

    uint256 n = 0;

    function add() public returns (uint256) {
        n = n.add(1);
        return n;
    }

    //  decoded output	{ "0": "uint8: 0" }

    function subtract() public returns (uint256) {
        n = n.sub(1);
        return n;
        //decoded output	{ "0": "uint8: 255" }
    }
}

// Building with SafeMath library on OpenZepplin
