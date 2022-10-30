// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

/*
smart contract that allows
1. deposits from everyone
2. withdraw all
3. withdraw to address
*/
contract DepositWithdrawMoney {
    uint public balanceReceived;

    function deposit() public payable {
        balanceReceived += msg.value;
    }

    function withdrawAll() public {
        address payable to = payable(msg.sender);
        to.transfer(getContractBalance());
    }

    function withdrawToAddress(address payable to) public {
        to.transfer(getContractBalance());
    }

    function getContractBalance() public view returns(uint) {
        return address(this).balance;
    }
}
