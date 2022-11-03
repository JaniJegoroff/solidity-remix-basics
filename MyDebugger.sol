//SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract MyDebugger {
    uint public myUint = 123;

    function setMyUint(uint newUint) public {
        myUint = newUint;
    }
}
