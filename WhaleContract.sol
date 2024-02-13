// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Lottix.sol";
import "./GenerateNewLottery.sol";


contract WhaleAccount {
    ILottery public currentLottery;
    address[] public lotteryAddresses;
    address public FactoryAddress;
    string public GeneratedLotteryName;
    event CrowdsaleGenerated(address indexed crowdsaleAddress);
    address public tixTokenAddress;
    uint whalecut;
    function setCurrentLottery(address _lotteryAddress) public {
        currentLottery = ILottery(_lotteryAddress);
        FactoryAddress = address(this);
    }

    function fetchLotteryDetails() public view returns (uint, uint, address, uint, uint, uint, uint, uint, uint) {
        return(
            currentLottery.initialJackpot(),
            currentLottery.treasurycut(),
            currentLottery.WhaleKey(),
            currentLottery.ticketprice(),
            currentLottery.whalepct_before(),
            currentLottery.whalepct_after(),
            currentLottery.whalepct_half(),
            currentLottery.lotterycap(),
            currentLottery.lottDigitAmount()
            );
    }

    function generateLotteryName(string memory _currentLottery, uint initialJackpot) public returns (string memory) {
        bytes32 timehash = keccak256(abi.encodePacked(currentLottery, block.timestamp));
        // Convert the hash to a string and take the last 5 characters
        string memory hashString = bytes32ToString(timehash);
        string memory lastFive = substring(hashString, bytes(hashString).length - 5, bytes(hashString).length);
        string memory lotteryName = string(abi.encodePacked(_currentLottery, " #", lastFive, uintToString(initialJackpot)));
        GeneratedLotteryName = lotteryName; // Store the generated name in a state variable if needed elsewhere
        return lotteryName;
    }

    function generateLottery(
        uint256 _tickPrice,
        uint8 _lottDigitAmount,
        string memory _currentLottery,
        uint initialJackpot  
    ) public {
        string memory LotteryName = generateLotteryName(_currentLottery, initialJackpot);

        Lottix newCrowdsale = new Lottix(
            tixTokenAddress,
            address(this),
            _lottDigitAmount,
            LotteryName,
            _tickPrice

        );
        lotteryAddresses.push(address(newCrowdsale));
        emit CrowdsaleGenerated(address(newCrowdsale));
    }

    function retrieveAddresses() public view returns (address[] memory) {
        return lotteryAddresses;
    }

        // Helper function to convert bytes32 to string
    function bytes32ToString(bytes32 _bytes32) private pure returns (string memory) {
        bytes memory bytesArray = new bytes(64);
        for (uint256 i; i < 32; i++) {
            bytesArray[i*2] = byteToHexChar(uint8(_bytes32[i]) / 16);
            bytesArray[1+i*2] = byteToHexChar(uint8(_bytes32[i]) % 16);
        }
        return string(bytesArray);
    }

    // Helper function to convert byte to hex char
    function byteToHexChar(uint8 b) private pure returns (bytes1) {
        if (b < 10) return bytes1(uint8(b) + 48);
        else return bytes1(uint8(b) + 87); // Convert to lowercase hex a-f
    }

    // Helper function to get a substring from a string
    function substring(string memory str, uint startIndex, uint endIndex) private pure returns (string memory) {
        bytes memory strBytes = bytes(str);
        bytes memory result = new bytes(endIndex - startIndex);
        for (uint i = startIndex; i < endIndex; i++) {
            result[i-startIndex] = strBytes[i];
        }
        return string(result);
    }

    // Implement uintToString
    function uintToString(uint _i) private pure returns (string memory) {
        if (_i == 0) {
            return "0";
        }
        uint j = _i;
        uint len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint k = len;
        while (_i != 0) {
            k = k-1;
            uint8 temp = (48 + uint8(_i - _i / 10 * 10));
            bytes1 b1 = bytes1(temp);
            bstr[k] = b1;
            _i /= 10;
        }
        return string(bstr);
    }


    function LotteryPhase(uint initialJackpot, uint lotterycap) public {
        if (initialJackpot < lotterycap) {
            whalecut = whalepct_before;
        }
        else {
            revert("How did you manage a Lottery with no phase?????");
        }
    // Distribute payments using basis points for percentages
       // uint256 whaleAmount = pricing.tickPrice.mul(whalePercentage).div(10000); // Use 10000 for basis point calculation
        //uint256 treasuryAmount = pricing.tickPrice.mul(treasuryCut).div(100); // Assuming treasuryCut is still a percentage
        //uint256 poolAmount = pricing.tickPrice.sub(whaleAmount).sub(treasuryAmount);


        // Transfer amounts
       // payable(owner()).transfer(whaleAmount);
       // payable(address(this)).transfer(treasuryAmount);
       // payable(lotteryPoolWallet).transfer(poolAmount);

    }
}


















    //Check if the crowdsale is open
    //modifier onlyWhileOpen() {
        //require(block.timestamp >= timing.openingTime && block.timestamp <= timing.closingTime, "Crowdsale is not open");
        //;
    //}

    // Define a function for buying tickets and choosing lottery numbers
    //function purchaseTickets(uint256[] calldata guesses) external payable onlyWhileOpen nonReentrant whenNotPaused {
        //require(guesses.length == timing.lottDigitAmount, "Invalid number of digits");
        //require(msg.value >=pricing.tickPrice, "Insufficient funds");


        

        // Save lottery guesses
        //lotteryGuesses[msg.sender] = guesses;

        // Guess Counter Goes Up By 1
        //_guessCount++;

        //emit TicketPurchased(msg.sender, guesses); // Run the Event 'LotteryGuess'
    //}
    //Define a function to retrieve the number of time someone has guessed on this lottery
    //function totalGuesses() public view returns (uint256) {
        //return _guessCount;
  //  }

    // Define a function to check if the crowdsale is open
    //function isOpen() public view returns (bool) {
        //return block.timestamp >= timing.openingTime && block.timestamp <= timing.closingTime;
  //  }




/* ADMIN FUNCTIONS */


    // Function to withdraw tokens accidentally sent to the contract
    //function withdrawTokens(address _token, address _to, uint256 _amount) external onlyOwner {
       // require(_to != address(0), "Invalid address");
        //IERC20(_token).transfer(_to, _amount);
    //}

    // Function to withdraw Ether from the contract
    //function withdrawEther(address payable _to, uint256 _amount) external onlyOwner {
       // require(_to != address(0), "Invalid address");
       // require(address(this).balance >= _amount, "Insufficient balance");
       // _to.sendValue(_amount);
  //  }

    // Fallback function to receive Ether
  //  receive() external payable {}
//}}
//}