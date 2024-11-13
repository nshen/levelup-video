// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test, console} from "forge-std/Test.sol";

import {C} from "../src/Constructor.sol";

contract ConstructorTest is Test {
    function testConstructors() public {
        C c = new C("name", 42);
    }

    // 'x' is a local variable and is stored in 'memory'
    function calculateSum(
        uint256[] calldata arr
    ) public pure returns (uint256) {
        uint256 sum = 0; // 'sum' is a local variable and is stored in 'memory'
        for (uint256 i = 0; i < arr.length; i++) {
            sum += arr[i]; // 'arr[i]' is read from 'calldata'
        }
        return sum;
    }
}
