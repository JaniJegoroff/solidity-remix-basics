// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract MyConstructor {
    address public myAddress;

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
