## view and pure

view: only read, promise no state will be changed

pure: no state will be changed nor read

no gas

```solidity

contract MyContract {
    uint x = 5;
    uint y = 10;

    function myViewFunction() external view returns(uint) {
        return x + y; // only read x and y
    }

    function myPureFunction() external pure {
        uint x = 5;
    }

}

```
