// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract MyStrings {
    string public myString = "Hello World";
    bytes public myBytes = "Hello World";

    function setMyString(string memory _myString) public {
        myString = _myString;
    }

    function setMyBytes(bytes memory _myBytes) public {
        myBytes = _myBytes;
    }

    function compareMyString(string memory _myString) public view returns(bool) {
        return keccak256(abi.encodePacked(myString)) == keccak256(abi.encodePacked(_myString));
    }

    function getMyBytesLength() public view returns(uint) {
        return myBytes.length;
    }
}

// read myBytes in ascii format
// web3.utils.toAscii('<address>') => "Hello World"
