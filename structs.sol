// SPDX-License-Identifier: MIT
pragma solidity ^0.7.4;

contract Students {
    struct Student {
        uint256 age;
        string name;
    }

    Student[] students;

    function addStudent(uint256 _age, string memory _name) public {
        Student memory newStudent = Student(_age, _name);
        students.push(newStudent);
    }

    function getStudent(uint256 _index)
        public
        view
        returns (uint256, string memory)
    {
        Student memory newStudent = students[_index];
        return (newStudent.age, newStudent.name);
    }
}
// addPerson : 30, Dennis
// getPerson : 0 (at index 0)

// decoded output : { "0": "uint256: 30", "1": "string: Dennis" }

/*

Structs: 

-  Structs if compared to JS are like objects
-  Similar to defining a class
-  Can define your own data structure and what properties it should have
-  If you want to create an instance you set it
-  You define what properties your data should have 
-  And if you want to create an instance of your data, you set an instance of that data
-  When you define a struct in the global contract scope you can then use that as it's own type

*/
