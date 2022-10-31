// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

/*
Secure smart contract that allows everyone to deposit money and only allows to
withdraw what you have deposited.
*/

contract MySecureMappingWithdrawMoney {
    mapping(address => uint) public balanceReceived;

    function deposit() public payable {
        balanceReceived[msg.sender] += msg.value;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function withdrawAll(address payable to) public {
        uint balanceToWithdraw = balanceReceived[msg.sender];
        balanceReceived[msg.sender] = 0;
        to.transfer(balanceToWithdraw);
    }

    function withdrawPartial(address payable to, uint amount) public {
        require(amount <= balanceReceived[msg.sender], "not enough funds");
        balanceReceived[msg.sender] -= amount;
        to.transfer(amount);
    }
}
