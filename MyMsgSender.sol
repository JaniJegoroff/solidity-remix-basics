// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract MyMsgSender {
    address public myAddress;

    function setMyAddress() public {
        myAddress = msg.sender;
    }

    function getMyAddressBalance() public view returns(uint) {
        return myAddress.balance;
    }
}
