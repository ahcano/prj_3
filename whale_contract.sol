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
    //token = IERC20(_token);
    //lotteryPoolWallet = _lotteryPoolWallet;
    
    function Lottix_deposit_to_whale() public payable {
        WhaleAccountBalance = address(this).balance;
    }
 
 //Information to sent to the lotto_byte dictionary: 
    //function set_lotto_info(string memory new_lottery_Name, address newWhale_wallet/*,uint newAccountBalance*/) public {
function set_lotto_info(string memory new_lottery_Name, address newWhale_wallet, uint256 Price, uint256 WhaleCut, uint256 HouseCut, uint256 Digits, uint256 Opens, uint256 Closes, uint256 Pot) public {
    lotteryName = new_lottery_Name;
    owner = newWhale_wallet;
    tickPrice = Price; // Corrected assignment
    whalePercentage = WhaleCut; // Corrected assignment
    treasuryCut = HouseCut; // Corrected assignment
    lottDigitAmount = Digits; // Corrected assignment
    openingTime = Opens; // Corrected assignment
    closingTime = Closes; // Corrected assignment
    initialJackpot = Pot; // Corrected assignment
}

//whale stakes crypto 
    function StakeETH(uint amount, address payable recipient) public {
        recipient.transfer(amount);
        WhaleAccountBalance = address(this).balance;
    }
   

/*function `StakeETH` is a withdrawing function that takes wei from the current contract balance. This function should accept a `uint` 
argument named `amount` and an `address payable` argument named `recipient`.

Inside the function, call the `transfer` method on the passed `recipient` argument, and specify the `amount` to transfer. Then declare an  `accountBalance` 
variable and set it equal to the balance of the contract. The body of the `sendRemittance` function should resemble the following:

 `this` refers to the smart contract itself. `this` helps distinguish a contract's own balance from any other balance.
*/

function get_lotto_Info() view public returns(string memory new_lottery_Name, address newWhale_wallet, uint Price, uint WhaleCut,uint HouseCut, uint Digits, uint Opens, uint Closes, uint Pot) {
        //return (lotteryName, owner, Price, WhaleCut, HouseCut, Digits, Opens, Closes, Pot);
        return (lotteryName, owner, tickPrice, whalePercentage, treasuryCut, lottDigitAmount, openingTime, closingTime, initialJackpot);
    }


//basic fallback function so that the contract can store ether that’s sent from outside the `deposit` function.
    function() external payable {}
}