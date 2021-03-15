// SPDX-License-Identifier: MIT
pragma solidity 0.7.4;

contract HelloWorld {
    function count(int256 number) public pure returns (int256) {
        for (int256 i = 0; i < 10; i++) {
            number++;
        }
        return number;
    }
}

// Deployed in Remix

/*

While Loop :
             The purpose of a while loop is to execute a statement or 
             code block repeatedly as long as an expression is true. 
             expression becomes false, the loop terminates.
             
contract HelloWorld {
    
    function count(int number) public pure returns(int) {
        int i = 0;
        while(i < 10) {
            number++; // number = number + 1
            i++;
        }
        return number;
        
    }
}


For Loop : 

    The for loop is the most compact form of looping. It includes the following three important parts :
    
-   The loop initialization where we initialize our counter to a starting value. 
    The initialization statement is executed before the loop begins.
    
-   The test statement which will test if a given condition is true or not. 
    If the condition is true, then the code given inside the loop will be executed,
    otherwise the control will come out of the loop.
    
-   The iteration statement where you can increase or decrease your counter.

*/
