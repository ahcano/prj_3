
pragma solidity ^0.8.0;

/ Winning numbers set based off results of external lottery results.
    function setWinningNumbers(uint8[7] calldata _winningNumbers) external onlyOwner {
        require(!numbersDrawn, "Winning numbers already set");
        for(uint i = 0; i < _winningNumbers.length; i++) {
            require(_winningNumbers[i] > 0 && _winningNumbers[i] <= 50, "Numbers must be between 1 and 50");
        }

        winningNumbers = _winningNumbers;
        numbersDrawn = true;
        emit WinningNumbersSet(winningNumbers);
    }

 // Function to pay out winners
    function payOutWinners() external onlyOwner {
        require(numbersDrawn, "Winning numbers not yet set");
        uint256 totalPrize = token.balanceOf(address(this));
        uint256 winnerCount = 0; // Keep track of winners

        for (uint i = 0; i < tickets.length; i++) {
            if (checkWinningTicket(tickets[i].numbers)) {
                winnerCount++;
                // Assuming equal split among winners for simplicity
                // In a real scenario, we might need a more complex distribution logic
            }
        }

        if(winnerCount > 0) {
            uint256 prizePerWinner = totalPrize / winnerCount;
            for (uint i = 0; i < tickets.length; i++) {
                if (checkWinningTicket(tickets[i].numbers)) {
                    token.transfer(tickets[i].buyer, prizePerWinner);
                    emit WinnerPaid(tickets[i].buyer, prizePerWinner);
                }
            }
        }
    }


function checkWinningTicket(uint8[7] memory numbers) private view returns (bool) {
        // Simplified check- not very efficient.
        for(uint i = 0; i < numbers.length; i++) {
            if(numbers[i] != winningNumbers[i]) {
                return false;
            }
        }
        return true;
    }
}