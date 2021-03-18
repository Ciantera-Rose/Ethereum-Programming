// SPDX-License-Identifier: MIT
pragma solidity ^0.7.4;

contract MemoryAndStorage {
    mapping(uint256 => User) users;

    struct User {
        uint256 id;
        uint256 balance;
    }

    function addUser(uint256 id, uint256 balance) public {
        users[id] = User(id, balance);
    }

    function updateBalance(uint256 id, uint256 balance) public {
        User storage user = users[id];
        user.balance = balance;

        //users[id].balance = balance; will result in same stored output
    }

    function getBalance(uint256 id) public view returns (uint256) {
        return users[id].balance;
    }
}

/*
    Data Location : - Has to do with where our data is stored
    
                    - memory :  - stores temporary data (for as long as function executes)
                                - used to store function args
                                - used to store variables within functions
                                
                                      
                    - storage : - Permanent storage of data
                                - ie. state variables >> uint data = 123
                                
                    - calldata : - used in more advanded use cases like optimizing how your 
                                   contract handles gas and memory 
                                 - similar to memory but READ-ONLY
                                 - cannot over-write variables
                                 - cheaper to execute 

*/
