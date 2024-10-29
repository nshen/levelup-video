// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Primitives {
    bool public boo = true;

    /*
    uint stands for unsigned integer, meaning non negative integers different sizes are available

        uint8   ranges from 0 to 2 ** 8 - 1
        uint16  ranges from 0 to 2 ** 16 - 1
        ...
        uint256 ranges from 0 to 2 ** 256 - 1
    */

    uint8 public u8 = 1;
    uint256 public u256 = 456;
    uint public u = 123; // uint is an alias for uint256

    /*
    Negative numbers are allowed for int types.
    Like uint, different ranges are available from int8 to int256

    int256 ranges from -2 ** 255 to 2 ** 255 - 1
    int128 ranges from -2 ** 127 to 2 ** 127 - 1

    */
    int8 public i8 = -1;
    int256 public i256 = 456;
    int public i = -123; // int is same as int256

    // minimum and maximum of int
    int256 public minInt = type(int256).min;
    int256 public maxInt = type(int256).max;

    address public addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;

    // Declare a fixed-size byte array
    bytes1 a = 0xb5; // [10110101]
    bytes1 b = 0x56; // [01010110]

    // Declare a bytes10 array
    bytes10 d = 0x68656c6c6f776f726c64; // "helloworld" in hexadecimal

    // Declare a bytes32 array
    bytes32 e =
        0x68656c6c6f776f726c6420202020202020202020202020202020202020202020; // "helloworld" padded with spaces in hexadecimal

    // Declare a dynamically-sized byte array
    bytes public c = "Hello, world!";
}
