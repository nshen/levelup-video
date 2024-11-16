// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;
import {MainContract, ExternalContract} from "../src/TryCatch.sol";

import {Test, console} from "forge-std/Test.sol";

contract TryCatchTest is Test {
    function testTryCatch() public {
        MainContract mainContract = new MainContract();
        mainContract.handleExternalCall(0);
        // mainContract.handleExternalCall(1);
        // mainContract.handleNewContract(
        //     0x0000000000000000000000000000000000000000
        // );

        //   0x4e487b710000000000000000000000000000000000000000000000000000000000000001
        // mainContract.handleNewContract(
        //     0x0000000000000000000000000000000000000001
        // );
        // mainContract.handleNewContract(
        //     0x0000000000000000000000000000000000000002
        // );
    }

    function testThrows() public {
        ExternalContract e = new ExternalContract(address(this));
        // try from 1 to 6
        try e.throwErrors(2) {
            console.log("Success!");
        } catch Error(string memory reason) {
            console.log("Error: %s", reason);
        } catch Panic(uint256 panicCode) {
            console.log("Panic:", panicCode);
        } catch (bytes memory lowlevelData) {
            console.log("bytes:");
            console.logBytes(lowlevelData);
            console.logBytes4(bytes4(abi.encodeWithSignature("CustomError()")));
        }
    }
}
