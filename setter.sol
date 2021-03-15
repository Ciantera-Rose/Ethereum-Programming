// SPDX-License-Identifier: MIT
pragma solidity 0.7.4;

// How to modify the state using functions

contract HelloWorld {
    int256 number;

    function getNumber() public view returns (int256) {
        return number;
    }

    function setNumber(int256 _number) public {
        number = _number;
    }
}

/*

The number is set to _number so it's changing the state. 
Neither view or pure is needed in this case

*/
