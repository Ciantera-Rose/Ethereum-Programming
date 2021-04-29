// SPDX-License-Identifier: MIT
pragma solidity ^0.7.5;

contract GasTest {
    function testExternal(uint256[10] calldata numbers)
        external
        pure
        returns (uint256)
    {
        return numbers[0];
    }

    // execution cost: 340 gas

    function testPublic(uint256[10] memory numbers)
        public
        pure
        returns (uint256)
    {
        return numbers[0];
    }
    // execution cost : 513 gas
}

/* public : - functions cost more gas for the same functionality. 
            - input arguments must be in memory 
            - can be called from an external source and from within the contract
            
  external : - can use calldata and the arguments are not written to memory, they 
               are just read from the actual function call
             - consumes less gas but cannot modify this array
             
  view : - reads from state variables, does not modify any data on the blockchain
         - generally free to execute
  
  pure : - Do not read from or write to storage or from our state variables
         - generally free to execute
         
*/
