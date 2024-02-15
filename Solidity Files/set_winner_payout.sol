// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract Lottery {
    address public owner;
    uint8[] public winningNumbers;
    bool public numbersDrawn;

    event WinningNumbersSet(uint8[]);
    
    
    constructor() {
        owner = msg.sender;

    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

// Winning numbers set based off results of external lottery results.
    function setWinningNumbers(uint8[] calldata _winningNumbers) external onlyOwner {
        require(!numbersDrawn, "Winning numbers already set");
        require(_winningNumbers.length == 9, "Must provide exactly 9 numbers");
         for(uint i = 0; i < _winningNumbers.length; i++) {
            require(_winningNumbers[i] > 0 && _winningNumbers[i] <= 50, "Numbers must be between 1 and 50");
        }
        
        winningNumbers = _winningNumbers;
        numbersDrawn = true;
        emit WinningNumbersSet(winningNumbers);
    }

function checkWinningTicket(uint8[] memory numbers) private view returns (bool) {
        // Simplified check- not very efficient.
        for(uint i = 0; i < numbers.length; i++) {
            if(numbers[i] != winningNumbers[i]) {
                return false;
            }
        }
        return true;
    }
}