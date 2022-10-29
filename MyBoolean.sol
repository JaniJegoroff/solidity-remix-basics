// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract MyBoolean {
    bool public myBool;

    function setMyBool(bool _myBool) public {
        myBool = _myBool;
    }
}
