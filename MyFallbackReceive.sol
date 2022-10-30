// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract MyFallbackReceive {
    uint public lastValueSent;
    string public lastFunctionCalled;

    /*
    1. empty CALLDATA -> receive() function is needed (if no fallback() function defined)
    2. non-empty CALLDATA -> fallback() function is needed
    */

    receive() external payable {
        lastValueSent = msg.value;
        lastFunctionCalled = "receive";
    }

    fallback() external payable {
        lastValueSent = msg.value;
        lastFunctionCalled = "fallback";
    }
}
