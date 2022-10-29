// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract ViewPure {
    uint public myStorageVariable;

    function setMyStorageVariable(uint _myStorageVariable) public {
        myStorageVariable = _myStorageVariable;
    }

    // view functions accessing state variables
    function getMyStorageVariable() public view returns(uint) {
        return myStorageVariable;
    }

    // pure functions not accessing state variables
    function getAdditions(uint a, uint b) public pure returns(uint) {
        return a+b;
    }
}
