// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import {Status} from "./GameStatus.sol";

contract Game {
    // Default value is the first element listed in
    // definition of the type, in this case "NotStarted"
    Status public status;

    // Returns uint
    // NotStarted - 0
    // InProgress - 1
    // GameOver   - 2
    // Won        - 3
    function getStatus() public view returns (Status) {
        return status;
    }

    // Update status by passing uint into input
    function setStatus(Status _status) public {
        status = _status;
    }

    // You can update to a specific enum like this
    function win() public {
        status = Status.Won;
    }

    // delete resets the enum to its first value, 0
    function reset() public {
        delete status;
    }
}
