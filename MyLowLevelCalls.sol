// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.17;

contract ContractOne {
    mapping(address => uint) public addressBalances;

    receive() external payable {
        addressBalances[msg.sender] += msg.value;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
}

contract ContractTwo {
    function deposit() public payable {}

    function depositOnContractOne(address _contractOne) public { 
        (bool success, ) = _contractOne.call{value: 10, gas: 100000}("");
        require(success);
    }
}
