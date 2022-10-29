// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract SafeMathInteger {
    uint public myUint;

    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }

    function incrementMyUint() public {
        ++myUint;
    }

    function decrementMyUint() public {
        // defaults to earlier version (0.7) of Solidity integer rollover behaviour
        unchecked { --myUint; }
    }
}
