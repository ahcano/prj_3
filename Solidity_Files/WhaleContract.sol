// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Lottix.sol";
import "./GenerateNewLottery.sol";
import "./ILotteryInterface.sol";


contract WhaleAccount {
    ILottery public currentLottery;
    address[] public lotteryAddresses;
    address public FactoryAddress;
    address payable public PoolKey;
    string public GeneratedLotteryName;
    event CrowdsaleGenerated(address indexed crowdsaleAddress);
    uint whalecut;
    uint initialJackpot;
    uint treasurycut;
    uint whalepct_before;
    uint whalepct_half;
    uint whalepct_after;
    uint lotterycap;
    address payable WhaleKey;
    address payable TreasuryKey;



    function setFactoryDetails() public returns (address, address payable){
        FactoryAddress = address(this);
        TreasuryKey = payable(0x004e1F9B29Db4F4325CaA5933763318D6460F40a);
        return (FactoryAddress, TreasuryKey);
    }
    

    function generateLotteryName(address _ContractKey) public returns (string memory) {
        bytes32 timehash = keccak256(abi.encodePacked(_ContractKey, block.timestamp));
        // Convert the hash to a string and take the last 5 characters
        string memory hashString = bytes32ToString(timehash);
        string memory lastFive = substring(hashString, bytes(hashString).length - 5, bytes(hashString).length);
        string memory lotteryName = string(abi.encodePacked(_ContractKey, " #", lastFive, uintToString(initialJackpot)));
        GeneratedLotteryName = lotteryName; // Store the generated name in a state variable if needed elsewhere
        return lotteryName;
    }

    function generateLottery(
        uint ticketprice,
        address ContractKey,
        uint lottDigitAmount,
        address tixTokenAddress
    ) public returns (address Payable){
        string memory LotteryName = generateLotteryName(ContractKey);

        Lottix newCrowdsale = new Lottix(
            tixTokenAddress,
            address(this),
            lottDigitAmount,
            LotteryName,
            ticketprice

        );
        PoolKey = payable(address(newCrowdsale));
        lotteryAddresses.push(address(newCrowdsale));
        emit CrowdsaleGenerated(address(newCrowdsale));
        return(PoolKey);   
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


    function LotteryPhase(uint _initialJackpot, uint _lotterycap) public {
    if (_initialJackpot < _lotterycap / 2) {
        // If the initialJackpot is less than half the lotterycap, use the before rate
        whalecut = currentLottery.whalepct_before();
    } else if (_initialJackpot >= _lotterycap / 2 && initialJackpot <= lotterycap) {
        // If the initialJackpot is at least half the lotterycap but not more than the cap, use the half rate
        whalecut = currentLottery.whalepct_half();
    } else if (_initialJackpot > _lotterycap) {
        // If the initialJackpot exceeds the lotterycap, use the after rate
        whalecut = currentLottery.whalepct_after();
    } else {
        revert("HOW DID YOU BREAK A DECENTRALIZED LOTTERY????");
    }
    }

    function payout() public payable {
        require(msg.value > 0, "No funds to distribute");
        require(address(this).balance >= msg.value, "Insufficient balance");
        uint256 whaleAmount = msg.value * whalecut / 10000;
        uint256 treasuryAmount = msg.value * treasurycut / 10000;
        uint256 poolAmount = msg.value - whaleAmount - treasuryAmount;    

        WhaleKey.transfer(whaleAmount);
        TreasuryKey.transfer(treasuryAmount);
        PoolKey.transfer(poolAmount);
    }



}


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