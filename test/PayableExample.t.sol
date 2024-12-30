// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test, console} from "forge-std/Test.sol";
import {PayableExample} from "../src/PayableExample.sol";

contract PayableExampleTest is Test {
    PayableExample payableExample;
    address payable recipient;

    function setUp() external {
        recipient = payable(address(this));
        payableExample = new PayableExample(recipient);
    }

    function testDeposit() public {
        uint256 initialBalance = address(payableExample).balance;
        assertEq(initialBalance, 0, "Initial balance should be 0");
        payableExample.deposit{value: 1 wei}();
        assertEq(
            address(payableExample).balance,
            initialBalance + 1 wei,
            "Balance should be 1 ether after deposit"
        );
        console.log(address(payableExample).balance);
    }

    function testWithdraw() public {
        payableExample.deposit{value: 1 ether}();
        uint256 initialBalance = address(payableExample).balance;
        uint256 initialRecipientBalance = recipient.balance;
        assertEq(initialBalance, 1 ether, "Initial balance should be 1 ether");
        payableExample.withdraw();
        assertEq(
            address(payableExample).balance,
            0,
            "Balance should be 0 after withdraw"
        );
        assertEq(
            recipient.balance,
            initialRecipientBalance + 1 ether,
            "Recipient balance should be 1 ether after withdraw"
        );
    }

    function testWithdrawFails() public {
        vm.expectRevert("No Ether to withdraw");
        payableExample.withdraw();
    }

    function testTransfer() public {
        payableExample.deposit{value: 1 ether}();
        uint256 initialBalance = address(payableExample).balance;
        uint256 initialRecipientBalance = recipient.balance;
        payableExample.transfer(recipient, 1 ether);
        assertEq(
            address(payableExample).balance,
            initialBalance - 1 ether,
            "Balance should be 0 after transfer"
        );
        assertEq(
            recipient.balance,
            initialRecipientBalance + 1 ether,
            "Recipient balance should be 1 ether after transfer"
        );
    }

    function testTransferFails() public {
        vm.expectRevert("Failed to send Ether");
        payableExample.transfer(recipient, 1 ether);
    }

    receive() external payable {}
}
