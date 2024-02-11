 /*
    
    Pre:requisites: 
    User has a Metamask account with a wallet_address
    User creates a LOTTIX account from the community UI.
    ETH_balance is zero in a new account 
    total_TIX may be a known number; either total TIX minted or total TIX sold. total_TIX = x    
    
*/    
pragma solidity ^0.5.0;

contract WhaleAccount {
    address owner;
    uint public WhaleAccountBalance;
    string lotteryName;
    uint256 tickPrice;
    uint256 whalePercentage;
    uint256 treasuryCut;
    uint256 lottDigitAmount;
    uint256 openingTime;
    uint256 closingTime;
    uint256 initialJackpot;

    // Function to get the current balance of the contract
    //function getWhaleAccountBalance() public view returns (uint) {
    //    return address(this).balance;
    //}

    // Function to deposit Ether into the contract
    function Lottix_deposit_to_whale() public payable {
        WhaleAccountBalance = address(this).balance;
    }

    // Function to set lotto information and transfer Ether
    function set_lotto_info(string memory new_lottery_Name, uint256 Price, uint256 WhaleCut, uint256 HouseCut, uint256 Digits, uint256 Opens, uint256 Closes, uint256 Pot, uint amount, address payable recipient) public {
        lotteryName = new_lottery_Name;
        owner = address(this);
        tickPrice = Price;
        whalePercentage = WhaleCut;
        treasuryCut = HouseCut;
        lottDigitAmount = Digits;
        openingTime = Opens;
        closingTime = Closes;
        initialJackpot = Pot;

        // Transfer amount to recipient
        recipient.transfer(amount);
        WhaleAccountBalance = address(this).balance;
    }

    // Function to get lotto information
    function get_lotto_Info() public view returns (string memory, address, uint, uint, uint, uint, uint, uint, uint) {
        return (lotteryName, owner, tickPrice, whalePercentage, treasuryCut, lottDigitAmount, openingTime, closingTime, initialJackpot);
    }

    // Fallback function to receive Ether
    function() external payable {}
}
