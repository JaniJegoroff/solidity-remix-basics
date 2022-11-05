//SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract MySelfDestruct {
    receive() external payable {}

    function destroySmartContract() public {
        // remaining funds stored in the contract will be credited to given address
        selfdestruct(payable(msg.sender));
    }
}
