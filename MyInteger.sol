// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract MyInteger {
    uint public myUint; // uint256
    uint8 public myUint8;
    int public myInt;

    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }

    function setMyUint8(uint8 _myUint8) public {
        myUint8 = _myUint8;
    }

    function setMyInt(int _myInt) public {
        myInt = _myInt;
    }

    function incrementMyUint() public {
        ++myUint;
    }

    function incrementMyUint8() public {
        ++myUint8;
    }

    function incrementMyInt() public {
        ++myInt;
    }
}
