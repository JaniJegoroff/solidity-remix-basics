// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract MyConstructor {
    address public myAddress;

    // constructor is only called once and only once during deployment
    constructor(address _someAddress) {
        myAddress = _someAddress;
    }

    function setMyAddress(address _myAddress) public {
        myAddress = _myAddress;
    }

    function setMyAddressMsgSender() public {
        myAddress = msg.sender;
    }
}
