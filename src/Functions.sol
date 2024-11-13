// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// Free function defined outside of a contract
// Always has implicit internal visibility
function freeFunction(uint a, uint b) pure returns (uint) {
    return a + b;
}

contract Simple {
    uint sum;

    // Function defined inside a contract
    // Takes two uint parameters as input
    function taker(uint a, uint b) public {
        sum = a + b;
    }

    // Function that returns multiple values
    // The names of return variables can be omitted
    function arithmetic(uint a, uint b) public pure returns (uint, uint) {
        return (a + b, a * b);
    }

    // Function that uses an early return
    // Must provide return values together with the return statement
    function earlyReturn(
        uint a,
        uint b
    ) public pure returns (uint _sum, uint product) {
        if (a == 0 || b == 0) {
            return (0, 0);
        }

        _sum = a + b;
        product = a * b;
    }
}

contract Function {
    // Functions can return multiple values.
    function returnMany() public pure returns (uint256, bool, uint256) {
        return (1, true, 2);
    }

    // Return values can be named.
    function named() public pure returns (uint256 x, bool b, uint256 y) {
        return (1, true, 2);
    }

    // Return values can be assigned to their name.
    // In this case the return statement can be omitted.
    function assigned() public pure returns (uint256 x, bool b, uint256 y) {
        x = 1;
        b = true;
        y = 2;
    }

    // Use destructuring assignment when calling another
    // function that returns multiple values.
    function destructuringAssignments()
        public
        pure
        returns (uint256, bool, uint256, uint256, uint256)
    {
        (uint256 i, bool b, uint256 j) = returnMany();

        // Values can be left out.
        (uint256 x, , uint256 y) = (4, 5, 6);

        return (i, b, j, x, y);
    }

    // Cannot use map for either input or output

    // Can use array for input
    function arrayInput(uint256[] memory _arr) public {}

    // Can use array for output
    uint256[] public arr;

    function arrayOutput() public view returns (uint256[] memory) {
        return arr;
    }
}

// Call function with key-value inputs
contract XYZ {
    function someFuncWithManyInputs(
        uint256 x,
        uint256 y,
        uint256 z,
        address a,
        bool b,
        string memory c
    ) public pure returns (uint256) {}

    function callFunc() external pure returns (uint256) {
        return someFuncWithManyInputs(1, 2, 3, address(0), true, "c");
    }

    function callFuncWithKeyValue() external pure returns (uint256) {
        return
            someFuncWithManyInputs({
                a: address(0),
                b: true,
                c: "c",
                x: 1,
                y: 2,
                z: 3
            });
    }
}
