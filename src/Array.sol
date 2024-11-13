// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/*
    Array can have a compile-time fixed size or a dynamic size.
*/
contract Array {
    // Several ways to initialize an array
    uint256[] public arr;
    uint256[] public arr2 = [1, 2, 3];

    // Fixed sized array, all elements initialize to 0
    uint256[10] public myFixedSizeArr;

    function get(uint256 i) public view returns (uint256) {
        return arr[i];
    }

    // Solidity can return the entire array.
    // But this function should be avoided for
    // arrays that can grow indefinitely in length.
    function getArr() public view returns (uint256[] memory) {
        return arr;
    }

    function push(uint256 i) public {
        // Append to array
        // This will increase the array length by 1.
        arr.push(i);
    }

    function pop() public {
        // Remove last element from array
        // This will decrease the array length by 1
        arr.pop();
    }

    function getLength() public view returns (uint256) {
        return arr.length;
    }

    function remove(uint256 index) public {
        // Delete does not change the array length.
        // It resets the value at index to it's default value,
        // in this case 0
        delete arr[index];
    }

    // https://solidity-by-example.org/array/
    function removeByShifting(uint256 _index) public {
        require(_index < arr.length, "Index out of bounds");
        // Shift elements to fill the gap
        for (uint256 i = _index; i < arr.length - 1; i++) {
            arr[i] = arr[i + 1];
        }
        arr.pop();
    }

    // https://solidity-by-example.org/array/
    function removeBySwapping(uint256 _index) public {
        // Deleting an element creates a gap in the array.
        // One trick to keep the array compact is to
        // move the last element into the place to delete.
        require(_index < arr.length, "Index out of bounds");
        // Move the last element to the index being removed
        arr[_index] = arr[arr.length - 1];
        arr.pop();
    }

    function examples() external pure {
        // create array in memory, only fixed size can be created
        uint256[] memory a = new uint256[](5);
        // memory calldata storage
    }
}
