// SPDX-License-Identifier: MIT
pragma solidity ^0.7.5;

// CRUD : Create Read Update Delete
contract mappedWithUnorderedIndexAndDelete {
    struct EntityStruct {
        uint256 entityData;
        // can add more data
        uint256 listPointer; //0 // each struct has the index in the array
    }

    mapping(address => EntityStruct) public entityStructs;
    address[] public entityList;

    // now we have the index in the array and know where the struct is in the list
    // so for each address we can enter that address into the mapping and get the data and
    // the place of that address in the array

    function isEntity(address entityAddress)
        public
        view
        returns (bool isIndeed)
    {
        if (entityList.length == 0) return false;
        return (entityList[entityStructs[entityAddress].listPointer] ==
            entityAddress);
    }

    function getEntityCount() public view returns (uint256 entityCount) {
        return entityList.length;
    }

    function newEntity(address entityAddress, uint256 entityData)
        public
        returns (bool success)
    {
        if (isEntity(entityAddress)) revert();
        entityStructs[entityAddress].entityData = entityData;
        entityList.push(entityAddress);
        entityStructs[entityAddress].listPointer = entityList.length - 1;
        return true;
    }

    function updateEntity(address entityAddress, uint256 entityData)
        public
        returns (bool success)
    {
        if (!isEntity(entityAddress)) revert();
        entityStructs[entityAddress].entityData = entityData;
        return true;
    }

    //[ADRESS1, ADDRESS2, ADDRESS3, ADDRESS4]

    function deleteEntity(address entityAddress) public returns (bool success) {
        if (!isEntity(entityAddress)) revert();
        uint256 rowToDelete = entityStructs[entityAddress].listPointer; // = 1
        address keyToMove = entityList[entityList.length - 1]; //save address4 (address at end of the list)
        entityList[rowToDelete] = keyToMove;
        entityStructs[keyToMove].listPointer = rowToDelete; // set from 4 to 2
        entityList.pop();
        delete entityStructs[entityAddress];
        return true;
    }
}
