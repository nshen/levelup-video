// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/*

Don't write loops that are unbounded as this can hit the gas limit, causing your transaction to fail.

For the reason above, while and do while loops are rarely used.

*/

contract Loops {
    // 'for' loop example
    function sumUpTo(uint256 n) public pure returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 0; i <= n; i++) {
            sum += i;
        }
        return sum; // Returns the sum of all numbers up to 'n'
    }

    // 'while' loop example
    function countDownFrom(uint256 n) public pure returns (uint256[] memory) {
        uint256[] memory countdown = new uint256[](n);
        while (n > 0) {
            countdown[n - 1] = n;
            n--;
        }
        return countdown; // Returns an array counting down from 'n' to 1
    }

    // 'do-while' loop example (use with caution due to potential for infinite loops)
    function doWhileLoop(uint256 n) public pure returns (uint256) {
        uint256 i = 0;
        do {
            i++;
        } while (i < n);
        return i; // Returns 'n'
    }
}
