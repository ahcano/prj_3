// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TIX is ERC20{
    constructor() ERC20("TIX", "TIX") {
        // Mint 1,000,000 tokens to the deployment address when deployed
        _mint(msg.sender, 9000000 * (10 ** uint256(decimals())));
    }


    // Function to allow minting by a designated minter
    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }
}