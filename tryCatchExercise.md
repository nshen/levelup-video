# 21

## 1

```solidity

contract Events {

// Declare an event named 'MyEvent' with no parameters

event MyEvent();


}

```

## 2

```solidity

contract Events {

// Declare an event named 'MyEvent' with a single parameter of type uint256 named 'myParam'

event MyEvent(uint256 myParam);

}
```

## 3

```solidity

event MyEvent(uint256 myParam);

function emitMyEvent() public {
    emit MyEvent(123);
}

```

## 4


```solidity

event MyEvent(uint256 indexed myParam);
```

## 5


```solidity

event MyEvent(uint256 indexed myParam);
function emitMyEvent() public {
    emit MyEvent(123);
}

```

# 22



## 1


```solidity
uint weiValue = 1 wei;
```



## 2

```solidity
uint gweiValue = 1 gwei;
```

## 3


```solidity
uint etherValue = 1 ether;
```

## 4

1 ether is equivalent to 10^18 wei.
1 gwei is equivalent to 10^9 wei.

```solidity
uint weiToGwei = 1 ether/ 1 gwei;
```


## 5

```solidity
uint weiToEther = 1e18 wei / 1 ether;
```



# 23

1.

```solidity
address payable recipient;
```

2.

```solidity

address payable recipient;

constructor(){
    recipient = payable(msg.sender);
}
```

3.

```solidity
address payable recipient;

constructor(){
    recipient = payable(msg.sender);
}

function deposit() public payable{}
```


4.

```solidity
address payable recipient;

constructor(){
    recipient = payable(msg.sender);
}

function deposit() public payable {}

function withdraw() public {
    (bool success,) = recipient.call{value:address(this).balance}('');
    require(success, 'Failed to send Ether');
}

```
 
5.

```solidity


address payable recipient;

constructor(){
    recipient = payable(msg.sender);
}

function deposit() public payable {}

function withdraw() public {
    (bool success,) = recipient.call{value:address(this).balance}('');
    require(success, 'Failed to send Ether');
}

receive() external payable {
    deposit();
}


```

25

```solidity
address payable recipient = payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);

```

2.
```solidity
uint256 amount  = 1 ether;
```


3.

```solidity
function sendEther public {
    (bool success,) = recipient.call{value:amount}('');
    require(success, 'Failed to send Ether');
}
```

## 25

1. 

```solidity
address payable recipient = payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
```

2.

```solidity
uint256 amount = 1 ether;
```

3.

```solidity
function sendEther() public {
    (bool success, ) = recipient.call{value:amount}('');
    require(success, 'Failed to send Ether');
}
```

4.

```solidity
//1
import '@openzeppelin/contracts/security/ReentrancyGuard.sol';

// 2
contract SendEtherGuarded is ReentrancyGuard {
// 3
// 4
// 5
  function sendEther(address payable recipient, uint256 amount) external payable nonReentrant {

// 6
    require(address(this).balance >= amount, 'Not enough Ether');
// 7

    (bool success, ) = recipient.call{value: amount}('');
// 8
    require(success, 'Failed to send Ether');
  }
}




```


5. 


```solidity

//1
contract SendEtherChecked{
// 2
 mapping(address => uint256) public balances;
//3
// 4
 function sendEther(address payable recipient, uint256 amount){
    //5
    require(balances[msg.sender] >= amount, 'Not enough Ether');
    // 6
    balances[msg.sender] -= amount;
    balances[recipient] += amount;
    // 7
    (bool success, ) = recipient.call{value: amount}('');
    // 8
    require(success, 'Failed to send Ether');

}
}



```
