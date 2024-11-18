// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// Error for insufficient balance for transfer. Needed `required` but only
// `available` available.
// @param available balance available.
// @param required requested amount to transfer.
error InsufficientBalance(uint256 available, uint256 required);

// Error for invalid recipient address
error InvalidRecipient(address recipient);

// Error for transfer amount being zero
error ZeroTransfer();

contract MyToken {
    mapping(address => uint) balance;

    function transfer(address to, uint256 amount) public {
        if (amount > balance[msg.sender]) {
            // revert InsufficientBalance({
            //     available: balance[msg.sender],
            //     required: amount
            // });
            revert InsufficientBalance(balance[msg.sender], amount);
        }

        if (to == address(0)) {
            revert InvalidRecipient(to);
        }

        if (amount == 0) {
            revert ZeroTransfer();
        }

        balance[msg.sender] -= amount;
        balance[to] += amount;
    }
    // ...
}
