//SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract MyExceptionRequire {
    mapping(address => uint) public balanceReceived;

    function receiveMoney() public payable {
        balanceReceived[msg.sender] += msg.value;
    }

    function withdrawMoney(address payable _to, uint _amount) public {
        // 1. not good way
        // if(_amount <= balanceReceived[msg.sender]) {
        //     balanceReceived[msg.sender] -= _amount;
        //     _to.transfer(_amount);
        // }

        // 2. better way -> use require as input validation and return clear message
        // to the user in case of exception
        require(_amount <= balanceReceived[msg.sender], "not enough funds");
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
}
