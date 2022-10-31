// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract MyMapping {
    mapping(uint => bool) public myUintBoolMapping;
    mapping(address => uint) public myAddressUintMapping;
    mapping(uint => mapping(uint => bool)) public myUintUintBoolMapping;
    mapping(uint => bool) myPrivateUintBoolMapping;

    function setMyUintBoolValue(uint _myUint) public {
        myUintBoolMapping[_myUint] = true;
    }

    function setMyAddressUintValue(uint _myUint) public {
        myAddressUintMapping[msg.sender] = _myUint;
    }

    function setMyUintUintBoolValue(uint _myUint1, uint _myUint2) public {
        myUintUintBoolMapping[_myUint1][_myUint2] = true;
    }

    function setMyPrivateUintBoolValue(uint _myUint) public {
        myPrivateUintBoolMapping[_myUint] = true;
    }

    function getMyPrivateUintBoolValue(uint _myUint) public view returns(bool) {
        return myPrivateUintBoolMapping[_myUint];
    }
}
