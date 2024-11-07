// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract ViewAndPureExample {
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
