// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Import OpenZeppelin's ERC20 implementation
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// Definie the contract with the named TIX and define it as an ERC20 token
contract TIX is ERC20 {
    // Initialize the constructor funtion for the token with name "TIX" and symbol "TIX" 
    constructor () ERC20("TIX", "TIX") {
        // Mint 1,000,000 tokens to the deployment address when deployed
        _mint(msg.sender, 1000000 * (10 ** uint256(decimals())));
    }
}