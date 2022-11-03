// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.17;

/*
Requirements:

1. The wallet has one owner
2. The wallet should be able to receive funds, no matter what
3. It is possible for the owner to spend funds on any kind of address, no matter if its a 
so called Externally Owned Account (EOA - with a private key), or a Contract Address
4. It should be possible to allow certain people to spend up to a certain amount of funds
5. It should be possible to set the owner to a different address by a minimum of 3 out of 5 
guardians in case of funds are lost
*/

contract MyWallet {
    address payable owner;
    address payable nextOwner;

    mapping(address => uint) public allowance;
    mapping(address => bool) public isAllowedToSend;

    mapping(address => bool) public guardian;
    uint guardiansResetCount;
    uint public constant confirmationsFromGuardiansForReset = 3;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function proposeNewOwner(address payable newOwner) public {
        require(guardian[msg.sender], "You are not a guardian");

        if(nextOwner != newOwner) {
            nextOwner = newOwner;
            guardiansResetCount = 0;
        }

        ++guardiansResetCount;

        if(guardiansResetCount >= confirmationsFromGuardiansForReset) {
            owner = nextOwner;
            nextOwner = payable(address(0));
        }
    }

    function setAllowance(address _from, uint _amount) public {
        require(msg.sender == owner, "You are not the owner");
        allowance[_from] = _amount;
        isAllowedToSend[_from] = true;
    }

    function denySending(address _from) public {
        require(msg.sender == owner, "You are not the owner");
        isAllowedToSend[_from] = false;
    }

    function transfer(address payable _to, uint _amount, bytes memory payload) public returns (bytes memory) {
        require(_amount <= address(this).balance, "Cannot send more than the contract owns");

        if(msg.sender != owner) {
            require(isAllowedToSend[msg.sender], "You are not allowed to send any transactions");
            require(allowance[msg.sender] >= _amount, "You cannot send more than you are allowed");
            allowance[msg.sender] -= _amount;
        }

        (bool success, bytes memory returnData) = _to.call{value: _amount}(payload);
        require(success, "Transaction failed");
        return returnData;
    }
}
