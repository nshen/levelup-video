// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract MyContract {
    // Define events
    event Transaction(
        address indexed sender,
        address indexed receiver,
        uint256 amount
    );
    event UserRegistered(address indexed user, string name);
    event UserUpdated(address indexed user, string name);
    event ContractPaused();
    event ContractResumed();

    // Struct to hold user data
    struct User {
        string name;
    }

    // Mapping from address to User data
    mapping(address => User) public users;

    // Variable to track whether the contract is paused
    bool public paused = false;

    // Function to transfer funds
    function transferFunds(address receiver, uint256 amount) public {
        (bool success, ) = receiver.call{value: amount}("");
        require(success, "Transfer failed.");

        // Emit the event to log the transaction
        emit Transaction(msg.sender, receiver, amount);
    }

    // Function to register a new user
    function registerUser(string memory name) public {
        users[msg.sender] = User(name);
        emit UserRegistered(msg.sender, name);
    }

    // Function to update a user's information
    function updateUser(string memory name) public {
        users[msg.sender].name = name;
        emit UserUpdated(msg.sender, name);
    }

    // Function to pause the contract
    function pauseContract() public {
        paused = true;
        emit ContractPaused();
    }

    // Function to resume the contract
    function resumeContract() public {
        paused = false;
        emit ContractResumed();
    }
}
