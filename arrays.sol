// SPDX-License-Identifier: MIT
pragma solidity ^0.7.4;

contract myContract {
    int256[] numbers;

    function addNumber(int256 _number) public {
        numbers.push(_number);
    }

    function getNumber(uint256 _index) public view returns (int256) {
        return numbers[_index];
    }
}

// decoded output : addNumber 10 >> getNumber >> int256: 10
// { "0": "int256: 10" }  

// ================================================================================

contract myArrayContract {
    int256[] numbers;

    function addNumbers(int256 _number) public {
        numbers.push(_number);
    }

    function getNumbers() public view returns (int256[] memory) {
        return numbers;
    }
}
// decoded output : { "0": "int256[]: 2,21,42,7,18" } 


// Arrays are a collection /list of values/elementss in one single data structure
//  - In Solidity Arrays are declared with [], like JS, but in Solidity
//      the brackets go after the type
//  - Version 6.0 ^ allows for returning Arrays
