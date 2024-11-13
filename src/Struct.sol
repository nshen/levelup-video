// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./TaskStruct.sol";

contract Tasks {
    // Declare a dynamic array 'tasks' of 'Task' structs.
    Task[] public tasks;

    // Add a new task to the 'tasks' array.
    function addTask(
        string calldata _title,
        string calldata _description
    ) public {
        // 3 ways to initialize a struct
        // - calling it like a function
        Task(_title, _description, false);
        // - key value mapping
        Task({title: _title, description: _description, done: false});
        // - initialize an empty struct and then update it
        Task memory newTask;
        newTask.title = _title;
        newTask.description = _description;
        newTask.done = false;

        // Add the 'newTask' into the 'tasks' array.
        tasks.push(newTask);
    }

    // Mark a task as done.
    function markTaskAsDone(uint256 _index) public {
        // Get a reference to the task in the 'tasks' array using the '_index'.
        Task storage task = tasks[_index];
        task.done = true;
    }

    // Get the details of a task.
    function getTask(
        uint256 _index
    )
        public
        view
        returns (string memory title, string memory description, bool done)
    {
        Task storage task = tasks[_index];
        return (task.title, task.description, task.done);
    }

    // Update the title of a task.
    function updateTaskTitle(uint256 _index, string calldata _newTitle) public {
        Task storage task = tasks[_index];
        task.title = _newTitle; // Set the new title of the task
    }

    // Update the description of a task.
    function updateTaskDescription(
        uint256 _index,
        string calldata _newDescription
    ) public {
        Task storage task = tasks[_index];
        task.description = _newDescription;
    }

    // Delete the task from the 'tasks' array using the '_index'.
    // Note: The 'delete' keyword in Solidity doesn't actually delete the task from the 'tasks' array,
    // it just sets the task at the given index to its initial default state (i.e., an empty string ("") for 'title' and 'description', and 'false' for 'done').
    function deleteTask(uint256 _index) public {
        delete tasks[_index];
    }
}
