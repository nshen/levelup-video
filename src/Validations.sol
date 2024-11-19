// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract MyContract {
    mapping(address => uint) public balance;

    function deposit(uint amount) public {
        // Use require to validate inputs from external calls
        require(amount > 0, "Deposit amount must be greater than 0");

        balance[msg.sender] += amount;
    }

    function withdraw(uint amount) public {
        // Use require to validate inputs from external calls
        require(amount <= balance[msg.sender], "Insufficient balance");

        balance[msg.sender] -= amount;
    }

    function transfer(address to, uint amount) public {
        // Use revert to abort execution and revert state changes
        if (to == address(0)) {
            revert("Cannot transfer to zero address");
        }

        // Use require to validate inputs from external calls
        require(amount <= balance[msg.sender], "Insufficient balance");

        balance[msg.sender] -= amount;
        balance[to] += amount;

        // Use assert for internal errors that should never happen
        assert(balance[msg.sender] + amount == balance[to]);
    }
}
