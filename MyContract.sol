// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract MyContract {
    string public myString = "Hello World!";

    function setMyString(string memory _myString) public {
        myString = _myString;
    }
}
