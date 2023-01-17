// SPDX-License-Identifier: None
pragma solidity ^0.8.17;
import "./token.sol";

contract TestToken is Token {
    address echidna_caller = msg.sender;

    constructor() {
        paused();
        owner = address(0);
    }

    // to resolve the issue, add isOwner modifier to the Owner() function of Ownership contract

    //property mode fuzzing
    //the function name must be of kind => echidna_*
    function echidna_test() public view returns (bool) {
        return (is_paused);
    }

    // assertion mode fuzzing
    function test_pausable(uint256 anyValue) public view {
        //The benefit of assertion mode fuzzing over property mode is, we can have argumemts passed here
        // so, in essence echidna will be able to fuzz all values possible for the args as well!
        assert(is_paused);
        //cmd => echidna-test harsha_ex2_solution --contract TestToken --test-mode assertion
        // in assertion mode, we donot have any specific function name to be follwed, and hence we just have
        //assert stmts also mention --test-mode assertion
    }
}
