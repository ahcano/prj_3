// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./TIXMinter.sol";

contract Lottix is ReentrancyGuard, Ownable{
    IERC20 public tixToken;
    uint256 public tickPrice; // Price per token in Wei
    mapping(address => uint256[]) public guesses;
    uint public lottDigitAmount;
    string public lotteryName;
    address public initialOwner;
    address public FactoryAddress;
    uint256[] public winningNumbers;
    uint256 public guesscount;
    event TokensPurchased(address guesser, uint256[] guess);

    
    constructor(
        address _tixTokenAddress, 
        address _FactoryAddress,
        uint _lottDigitAmount,
        string memory _lotteryName,
        uint _tickPrice
    ) Ownable(_FactoryAddress) {
        tixToken = IERC20(_tixTokenAddress);
        tickPrice = _tickPrice;
        lottDigitAmount = _lottDigitAmount;
        lotteryName = _lotteryName;
    }

    // Users join the crowdsale by purchasing a TIX token at the value of tickPrice
    function joinCrowdsale(uint256[] calldata _guess) external payable nonReentrant {
        require(msg.value == tickPrice, "Incorrect ETH value sent");
        require(tixToken.balanceOf(address(this)) >= 1, "Not enough tokens in the contract");

    //  Check that the number of guesses matches lottDigitAmount
        require(_guess.length == lottDigitAmount, "Incorrect number of guesses");

    // Check that each guess is a 2-digit number
        for (uint256 i = 0; i < _guess.length; i++) {
            require(_guess[i] >= 10 && _guess[i] <= 99, "Guesses must be 2-digit numbers");
        }

        // Instead of transferring the token right away, we just record the user's guess
        guesses[msg.sender] = _guess;
        guesscount++;

        emit TokensPurchased(msg.sender, _guess);
    }

    // ADMIN FUNCTIONS

    // Allow the contract to receive ETH
    receive() external payable {}







    // Function to withdraw collected ETH to the owner's address
    function withdrawETH() external onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }

    // Function to withdraw accidentally sent ERC20 tokens
    function withdrawAccidentalERC20(address _tokenAddress) external onlyOwner {
        IERC20 token = IERC20(_tokenAddress);
        uint256 amount = token.balanceOf(address(this));
        token.transfer(owner(), amount);
    }
}

// CHECK CONVERSION FROM WEI TO ETH 