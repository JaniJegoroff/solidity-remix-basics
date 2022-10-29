// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract MyAddress {
    address public myAddress;

    function setMyAddress(address _myAddress) public {
        myAddress = _myAddress;
    }

    function getMyAddressBalance() public view returns(uint) {
        return myAddress.balance;
    }
}
