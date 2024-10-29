// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Operator {
    uint8 public constant x = 1;
    uint32 public constant y = 4;

    uint32 z = x + y;

    function add() public pure returns (uint32) {
        uint32 a = 5; // a is 5
        a *= 2; // a is now 10 (5 * 2)

        return a;
    }

    function leftShift() public pure returns (uint32) {
        uint32 b = 4; // b is 4 (binary representation: 100)
        b <<= 2; // b is now 16 (binary representation: 10000)
        return b;
    }

    function rightShift() public pure returns (uint32) {
        uint32 c = 16; // c is 16 (binary representation: 10000)
        c >>= 2; // c is now 4 (binary representation: 100)
        return c;
    }
}
