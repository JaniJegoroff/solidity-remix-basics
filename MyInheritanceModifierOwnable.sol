//SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract Owned {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier ownerOnly {
        require(msg.sender == owner, "you are not allowed");
        _;
    }
}
