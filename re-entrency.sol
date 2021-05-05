// SPDX-License-Identifier: MIT
pragma solidity ^0.7.5;

/* 
    Fallback Function: 
    - A fallback function causes a re-entrency attack
    - This function is called automatically when a contract gets a transfer

    Contract A

    fallback {
        contractB.withdraw()
    }

    -Has some other function that calls withdraw function in contract B

    -contract A receives transfer and the fallback function will be called

    Contract B

    -functionWithdraw {
        calls contractA.transfer()

        -This withdraw function will transfer ETH back to contract A, and that is
         when the fallback function is executed.
    } 

    The re-entrency attack happens when the fallback function is designed in such 
    a way that it once again calls contractB.withdraw() >> which will make another transfer
    and then it will run the fallback function again and continue this process in a loop aka 
    re-enters this function over and over again

 */

contract test {
    // UNSAFE CODE
    // open to a re-entrency attack and exploatation by another contract
    // ie: msg.sender is another contract that has a fallback function
    // calls this function and checks bal is > 0 (else error)
    // then calls send() on msg.sender and sends them balance
    // then sets balance to 0

    mapping(address => uint256) balance;

    function withdraw() public {
        require(balance[msg.sender] > 0); // CHECKS
        msg.sender.send(balance[msg.sender]); // INTERACTIONS
        balance[msg.sender] = 0; // EFFECTS
    }
}

/* 
    Problem:
    - Need to think about order we do things
    - Deposits funds and then withdraws it
    - Comes into function and once it gets to send() >> bal of ETH
    - It will get the tranfer of 10 ETH to its contract
    - Then the fallback function will execute (which has a withdraw call again)
    - Comes into function again and gets to send() call before setting balance to 0 in previous call
    - This will happen over and over again until ETH is completely depleted 
    - Fails to set balance back to 0 and prevent further withdraws

    FIX: 
    Pattern : Tells us what order we should do things
    - CHECKS
    - EFFECTS (changing the state of our contract)
    - INTERACTIONS (with other contracts and other wallets)
 */

contract test2 {
    mapping(address => uint256) balance;

    function withdraw() public {
        // re-enter
        require(balance[msg.sender] > 0); // CHECKS >> fallback comes in again but fails if balance > 0
        uint256 toTransfer = balance[msg.sender]; // save 10 ETH to variable
        balance[msg.sender] = 0; // EFFECTS // set balance to 0
        bool success = msg.sender.send(toTransfer); // INTERACTIONS // call and tranfer 10 ETH
        if (!success) {
            balance[msg.sender] = toTransfer; //
        }
    }
}

// This pattern needs to be implemented in both functions in order to not be exploited by this attack
// However Send and transfer only transfer a limited amount of gas to the fallback funcition (but that's not good enough)

/* 
    - ie: DAO Hack: 1st big hack that happened to a smart contract (re-entreny attack)
    - Send and transfer were introduced with a 2300 gas stipend in which the fallback
      function could execute logic up to that stipend amount

    - msg.sender.call.value(amount)(") >> dangerous
    - This only works if we don't change the gas costs or what operations cost >>not reliable
    - EIP1884

    - USE .call{value: toTransfer}("");
    - Can call a fucnction or no function at all, can scall a value etc...
    - (bool success,) : returns two things >> if call was successful or not and bytes memory data (left empty)
 */

contract test3 {
    mapping(address => uint256) balance;

    function withdraw() public {
        // re-enter
        require(balance[msg.sender] > 0); // CHECKS >> fallback comes in again but fails if balance > 0
        uint256 toTransfer = balance[msg.sender]; // save 10 ETH to variable
        balance[msg.sender] = 0; // EFFECTS // set balance to 0
        (bool success, ) = msg.sender.call{value: toTransfer}(""); // INTERACTIONS // call and tranfer 10 ETH
        if (!success) {
            balance[msg.sender] = toTransfer; //
        }
    }
}
