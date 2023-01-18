import "./mintable.sol";

contract TestMintableToken is MintableToken {
    address echidna_caller = msg.sender;

    constructor() public MintableToken(10000) {
        owner = echidna_caller;
    }

    // the error was due to wrapping up of a huge u256 num to a -ve int256 number

    function echidna_test() public returns (bool) {
        return balances[msg.sender] <= 10_000;
    }

    // to resolve the issue, we can just use uint256 for all the state variables,
    //because totalMintable, totalMinted will never be negative
}
