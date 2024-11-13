/*

    外部调用：
        1 外部合约调用
        2 transaction
    内部调用：
        3 当前合约
        4 子类合约


    Visibility:

        - external
            1,2
            f() does not work, but this.f() works
        - internal
            3,4
            Can take parameters of internal types like mappings or storage references.
        - public
            1,2,3,4
        - private
            3


*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract BaseContract {
    bool private isTrue = true;
    bool public isTrue2 = true;
    bool internal isTrue3 = true;

    // error:
    // bool external isTrue4 = true;

    // External function
    // - by other contracts and accounts
    function externalFunc() external pure returns (string memory) {
        return "External function called";
    }

    // This function will not compile since we're trying to call
    // an external function here.
    // function testExternalFunc() public pure returns (string memory) {
    //     return externalFunc();
    // }

    // Public function
    // - inside this contract
    // - inside derived contracts
    // - by other contracts and accounts
    function publicFunc() public pure returns (string memory) {
        return "Public function called";
    }

    // Internal function
    // - inside this contract
    // - inside derived contracts
    function internalFunc() internal pure returns (string memory) {
        return "Internal function called";
    }

    function testInternalFunc() public pure virtual returns (string memory) {
        return internalFunc();
    }

    // Private function
    // - inside this contract
    // Cannot be accessed from derived contracts or externally
    function privateFunc() private pure returns (string memory) {
        return "Private function called";
    }

    function testPrivateFunc() public pure returns (string memory) {
        return privateFunc();
    }

    function testFuncs() public view returns (string memory, string memory) {
        // Call the public and internal functions
        // Call the external function using "this"
        return (publicFunc(), this.externalFunc());
    }
}

contract DerivedContract is BaseContract {
    function callBaseFuncs()
        public
        pure
        returns (string memory, string memory)
    {
        // Can call the public and internal functions of the base contract
        return (publicFunc(), internalFunc());
    }
}

contract OtherContract {
    BaseContract private base = new BaseContract();

    function testFuncs() public view returns (string memory, string memory) {
        // Can call the public function of the BaseContract
        // Can call the external function of the BaseContract using "this"
        return (base.publicFunc(), base.externalFunc());
    }
}
