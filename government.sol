// SPDX-License-Identifier: MIT
pragma solidity ^0.7.5;

/* 
    This contract will save reports of what the bank contract is doing
*/

contract Governmant {
    struct Transaction {
        address from;
        address to;
        uint256 amount;
        uint256 txId;
    }

    // array of transactions where government saves every transactions that happens
    Transaction[] transactionLog;

    // create a new trasnaction object
    function addTransaction(
        address _from,
        address _to,
        uint256 _amount
    ) external {
        transactionLog.push(
            Transaction(_from, _to, _amount, transactionLog.length)
        );
    }

    function getTransaction(uint256 _index)
        public
        view
        returns (
            address,
            address,
            uint256
        )
    {
        return (
            transactionLog[_index].from,
            transactionLog[_index].to,
            transactionLog[_index].amount
        );
    }
}

/*
       External Contracts : - a contract that is deployed to the blockchain that is completely
                              separate from ours
                            - visibility level in which any external function is only allowed to be executed 
                              from other contracts from the outside
                            - Contract needs to know what contract functions are that you want to interact with
                            - Contract needs to know where contract is located
                            
                            - Needs interface to do this
                             
*/
