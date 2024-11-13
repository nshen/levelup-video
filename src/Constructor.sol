// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/console.sol";

/*
    A constructor is an optional function that is executed upon contract creation.
*/

// Simple contract with a constructor
contract SimpleContract {
    uint256 public immutable data;

    constructor(uint256 _data) {
        data = _data; // Initialize 'data' with the value passed to the constructor
    }
}

// Contract with a constructor and a function to change the data
contract ChangeableContract {
    uint256 public data;

    constructor(uint256 _data) {
        data = _data; // Initialize 'data' with the value passed to the constructor
    }

    function setData(uint256 _data) public {
        data = _data; // Change 'data' to the new value passed to the function
    }
}

// Base contract A
contract A {
    string public name;

    constructor(string memory _name) {
        name = _name; // Initialize 'name' with the value passed to the constructor
        console.log("A");
    }
}

// Contract B inherits from A and has its own data
contract B {
    uint256 public data;

    constructor(string memory _name, uint256 _data) {
        data = _data; // Initialize 'data' with the value passed to the constructor
        console.log("B");
    }
}

// Parent constructors are always called in the order of inheritance
// regardless of the order of parent contracts listed in the
// constructor of the child contract.

// Order of constructors called:
// 1. A
// 2. B
// 3. C
contract C is B, A {
    constructor(string memory _name, uint256 _data) A(_name) B(_name, _data) {
        console.log("C");
    }
}
