// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

/*
Simple example where only owner of the contract can update the message.
Message counter keeps track on how many times message has been updated.
*/

contract BlockchainMessenger {
    address public owner;
    uint public messageCounter;
    string public message;

    constructor() {
        owner = msg.sender;
        message = "Hello";
    }

    function setMessage(string memory _message) public {
        if(msg.sender == owner) {
            message = _message;
            ++messageCounter;
        }
    }
}
