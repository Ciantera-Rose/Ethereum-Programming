// SPDX-License-Identifier: MIT
pragma solidity ^0.7.5;
pragma abicoder v2;

/*
Test execution costs using mapping VS array: 

When executing the addEntity function, which design consumes the most gas (execution cost)? 
Is it a significant difference? Why/why not?

Add 5 Entities into storage using the addEntity function and 5 different addresses. 
Then update the data of the fifth address you used.
*/

// Use only an array:
contract StorageDesign_Array {
    struct Entity {
        uint256 data;
        address _address;
    }

    Entity[] EntityArray;

    // Creates a new entity for msg.sender and adds it to the array.
    // @uint _data, value that will be added
    function addEntity(uint256 _data) public returns (bool success) {
        Entity memory newEntity;
        newEntity.data = _data;
        newEntity._address = msg.sender;
        EntityArray.push(newEntity);
        return true;
    }

    // Updates the data in a saved entity for msg.sender
    // @uint _data, value that will be updated
    function updateEntity(uint256 _index, uint256 _data)
        public
        returns (bool success)
    {
        require(
            EntityArray[_index]._address == msg.sender,
            "Only entity owner can update values."
        );
        EntityArray[_index].data = _data;
        return true;
    }

    //   for (uint i = 0; i < EntityArray.length; i++) {
    //       if (EntityArray[i]._address == msg.sender) {
    //           EntityArray[i].data = _data;
    //           break;
    //       }
    // COST much more gas using a FOR LOOP

    // Just to validate data after update values.
    function getEntityArr() public view returns (Entity[] memory) {
        return EntityArray;
    }
} //END StorageDesign_Array

/*

Array :
Deployment Execution Cost :	341780 gas
addEntity Execution Cost : 	43407 gas | 47607 gas | 47607 gas | 47607 gas | 47607 gas
updateEntity Execution Cost : 	23481 gas | 8481 gas | 8481 gas | 8481 gas

Array For loop:
Deployment Execution Cost : 314355 gas
addEntity Execution Cost : 	43407 gas | 47607 gas | 47607 gas | 47607 gas | 47607 gas 
updateEntity Execution Cost : 	23959 gas | 11716 gas | 14473 gas | 17230 gas | 19987 gas 

*/
