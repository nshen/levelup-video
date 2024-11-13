// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/*

Getter functions can be declared view or pure.

View function declares that no state will be changed.
Pure function declares that no state variable will be changed or read.

*/

contract ViewAndPureExample {
    // view: only read, promise no state will be changed
    // pure: no state will be changed nor read

    uint public stateVar = 10;

    // View function
    // Can read state variables but cannot modify them
    function viewFunc() public view returns (uint) {
        return stateVar;
    }

    // Pure function
    // Cannot read or modify state variables
    function pureFunc(uint x, uint y) public pure returns (uint) {
        return x + y;
    }
}
