// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract TIX is ERC20, AccessControl {
    bytes32 public constant MINTER_ROLE = keccak256("NEWLOTTOTIX");
    // Initialize the constructor function for the token with name “TIX” and symbol “TIX”
    constructor() ERC20("TIX", "TIX") {
        // Mint 100,000 tokens to the deployment address when deployed
    _mint(msg.sender, 100000 * (10 ** uint256(decimals())));
    }
    // Function to allow minting by a designated minter
    function mint(address to, uint256 amount) public {
        require(hasRole(MINTER_ROLE, msg.sender), "Caller is not a minter");
        _mint(to, amount);
    }
    // Function to grant minting role to an address
    function grantMinterRole(address minter) public {
        require(hasRole(DEFAULT_ADMIN_ROLE, msg.sender), "Caller is not an admin");
        grantRole(MINTER_ROLE, minter);
    }
}
// Separate contract for minting, only allowing the owner to mint
contract MintingContract {
    TIX public tokenContract;
    constructor(address _tokenContract) {
        tokenContract = TIX(_tokenContract);
    }
    function mint(address to, uint256 amount) public {
        tokenContract.mint(to, amount);
    }
}