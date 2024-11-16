// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {console} from "forge-std/console.sol";

contract ExternalContract {
    address public owner;

    constructor(address _owner) {
        require(_owner != address(0), "Invalid address");
        assert(_owner != 0x0000000000000000000000000000000000000001);
        owner = _owner;
    }

    function performAction(uint256 x) public pure returns (string memory) {
        require(x != 0, "Require failed");
        return "Action performed";
    }

    error CustomError();

    function throwErrors(uint _num) public pure {
        if (_num == 0) {
            return;
        } else if (_num == 1) {
            //Error: Require failed
            require(false, "Require failed");
        } else if (_num == 2) {
            //Error: Revert failed
            revert("Revert failed");
        } else if (_num == 3) {
            // Panic: 1
            assert(false);
        } else if (_num == 4) {
            // Panic: 18
            uint a = 0;
            uint b = 1;
            b / a;
        } else if (_num == 5) {
            // bytes: 0x
            revert();
        } else if (_num == 6) {
            // bytes: 0xb8555d85
            revert CustomError();
        }
    }
}

contract MainContract {
    // event Log(string message);
    // event LogBytes(bytes data);

    ExternalContract public externalContract;

    constructor() {
        externalContract = new ExternalContract(msg.sender);
    }

    // Example of try / catch with external call
    // handleExternalCall(0) => Log("External call failed")
    // handleExternalCall(1) => Log("Action performed")
    function handleExternalCall(uint256 _i) public {
        try externalContract.performAction(_i) returns (string memory result) {
            console.log(result);
        } catch {
            console.log("External call failed");
        }
    }

    // Example of try / catch with contract creation
    // handleNewContract(0x0000000000000000000000000000000000000000) => Log("Invalid address")
    // handleNewContract(0x0000000000000000000000000000000000000001) => LogBytes("")
    // handleNewContract(0x0000000000000000000000000000000000000002) => Log("ExternalContract created")
    function handleNewContract(address _owner) public {
        try new ExternalContract(_owner) returns (
            ExternalContract _externalContract
        ) {
            // you can use variable _externalContract here
            console.log("ExternalContract created");
        } catch Error(string memory reason) {
            // catch failing revert() and require()
            console.log(reason);
        } catch (bytes memory reason) {
            // catch failing assert()
            console.logBytes(reason);
        }
    }
}
