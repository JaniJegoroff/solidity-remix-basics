// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract MyPayableModifier {
    string public myString = "Hello World";

    /*
    Allow sender to update message only if 1ETH is sent as value.
    Otherwise, return value back to sender.
    */
    function setMyString(string memory _myString) public payable {
        if(msg.value == 1 ether) {
            myString = _myString;
        }
        else {
            payable(msg.sender).transfer(msg.value);
        }
    }
}
