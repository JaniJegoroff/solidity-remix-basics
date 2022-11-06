// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

// Simple ERC20 token example utilising openzeppelin base contracts. 

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract MyRedBullToken is ERC20, AccessControl {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    event RedBullPurchased(address indexed receiver, address indexed buyer);

    constructor() ERC20("RedBullToken", "RBT") {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(MINTER_ROLE, msg.sender);
    }

    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        _mint(to, amount);
    }

    function buyOneRedBull() public {
        _burn(_msgSender(), 1);
        emit RedBullPurchased(_msgSender(), _msgSender());
    }

    function buyOneRedBullFrom(address account) public {
        _spendAllowance(account, _msgSender(), 1);
        _burn(account, 1);
        emit RedBullPurchased(_msgSender(), account);
    }
}
