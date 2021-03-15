// Javascript is a untyped language
var a = 1;        // Number
var b = "hello"   //  String
var c = false;    // Boolean
var d = 2.5;      // Float

// In contrast Solidity is a typed language
// Whenever we use and declare varaibles we need to tell Solidity what type of var we want to create
// Decimals do NOT exist in Solidity

// How to declare variables in Solidity: You must declare the type when declaring a var

// Primary Types in Solidity : 

int a = 1;   // signed integer : Can be negative
uint aa = 2  // unsigned integer : Cannot be negative
string b = "hello";
bool c = false;
address d = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;


// Cannot set one type to another type
a = "hello" // This will not work
a = 2       // This will work because it's a number