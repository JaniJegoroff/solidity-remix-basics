// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

/*
Let's look differences of using child contract and struct:
    child contract: high gas fee, 1WEI -> 221530 gas
    struct: low gas fee, 1WEI -> 75394 gas

    Additionally using struct makes implementation simpler.
*/

contract PaymentReceived {
    address public from;
    uint public amount;

    constructor(address _from, uint _amount) {
        from = _from;
        amount = _amount;
    }
}

contract WalletChildContract {
    PaymentReceived public payment;

    function payContract() public payable {
        payment = new PaymentReceived(msg.sender, msg.value);
    }
}

contract WalletStruct {
    struct PaymentReceivedStruct {
        address from;
        uint amount;
    }

    PaymentReceivedStruct public payment;

    function payContractStruct() public payable {
        payment = PaymentReceivedStruct(msg.sender, msg.value);
    }
}
