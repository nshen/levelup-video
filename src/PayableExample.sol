// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract PayableExample {
    // Payable address can receive Ether
    address payable public recipient;

    // Payable constructor can receive Ether
    constructor(address payable _recipient) {
        recipient = _recipient;
    }

    // Function to deposit Ether into this contract.
    // Call this function along with some Ether.
    function deposit() public payable {}

    // Function to withdraw all Ether from this contract.
    // Notice how this function below does not need payable keyword.
    // It has been defined in the global recipient variable.
    function withdraw() public {
        // get the amount of Ether stored in this contract
        uint256 amount = address(this).balance;
        if (amount == 0) {
            revert("No Ether to withdraw");
        }
        // send all Ether to recipient
        (bool success, ) = recipient.call{value: amount}("");
        require(success, "Failed to send Ether");
    }

    // Function to transfer Ether from this contract to another address
    function transfer(address payable _to, uint256 _amount) public {
        // Note that "_to" is declared as payable
        (bool success, ) = _to.call{value: _amount}("");
        require(success, "Failed to send Ether");
    }

    // This function is called when Ether is sent without data
    receive() external payable {
        deposit();
    }
}
