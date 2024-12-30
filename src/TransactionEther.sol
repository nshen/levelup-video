// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract SendEther {
    address public sender;
    uint256 public amount;

    mapping(address => uint256) public balances;

    function sendViaCall(address payable _to) public payable {
        // Remember to update the balance before interactions prevent reentrancy attacks!
        // Follow Checks-Effects-Interactions pattern

        balances[msg.sender] -= amount;
        balances[_to] += amount;

        // Call returns a boolean value indicating success or failure.
        // This is the current recommended method to use.
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }
}
