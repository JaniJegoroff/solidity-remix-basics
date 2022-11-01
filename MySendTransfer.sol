//SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

/*
Major difference between send() and transfer():
If the target address is a contract and the transfer fails, then .transfer will result in 
an exception and .send will simply return false, but the transaction won't fail.
*/

contract Sender {
    receive() external payable {}

    function withdrawTransfer(address payable _to) public {
        _to.transfer(10);
    }

    function withdrawSend(address payable _to) public {
        bool sentSuccessful = _to.send(10);
        require(sentSuccessful, "send failed");
    }
}

contract ReceiverNoAction {
    receive() external payable {}

    function balance() public view returns(uint) {
        return address(this).balance;
    }
}

contract ReceiverAction {
    uint public balanceReceived;

    receive() external payable {
        balanceReceived += msg.value;
    }

    function balance() public view returns(uint) {
        return address(this).balance;
    }
}
