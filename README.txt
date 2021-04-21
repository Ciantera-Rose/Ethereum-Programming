**Running Contract Functions :** 

- There are two ways in which we invoke funtions that belong to our contracts
- These two ways result in very different behavior

    
    1. - "Calling" A function : 
       -  When we call a function it cannot modify the contract's data at all.
       -  A call results in a return value
       -  Can return data
       -  Runs instantly, because it doesn't invlove a tx it doesn't need to be mined
       -  Free to 
       
    2. - Sending a tx to a function : When we want to modify any data stored in our contract, 
         we do not call the function anymore
       - Anytime we want to invoke a function that is intended to change some data, we are 
         going to be invoking it by sending a tx to our contract instance that targets a 
         specific network.
       - When we do this WE CAN modify a contract's data
       - Anytime we submit a tx to the network it takes time to be processed on the main ETH Network
       - GOTCHAA : Whenever we send a tx to a function it returns the transaction hash
         We can a tx id that lets us know tx occured but do not get a return value back
       - Sending a tx to a function costs money
    

    GAS : 
           - Powers the EVM (Ethereum Virtual Machine)
        - Makes sure there is an incentive for executing transactions on the network
        - Gas is the cost of executing transactions and to pay for storage
        - The cost of execution is paid by the sender
        - Prevents the network from being spammed with worthless transactions
        - The consumption of Gas is fixed. Meaning for each operation that happens
          in our smart contract there is a fixed price list for how much gas each of
          those operations consumes
        - The price of GAS is NOT fixed. Depends on market conditions, like how busy the EVM is
          and the number of transactions that are out there. SO the price of the gas unit will fluctuate
        - The most expensive operation in Solidity is to modify storage, meaning variables that are saved
          persistently in storage. Only save the data you really need permanently
