

    /*
    
    Pre:requisites: 
    User has a Metamask account with a wallet_address
    User creates a LOTTIX account from the community UI.
    ETH_balance is zero in a new account 
    total_TIX may be a known number; either total TIX minted or total TIX sold. total_TIX = x    
    
    
    A Whale stakes their ETH through the UI
    
    1. Whale selects amount of ETH to stake (backend function with ROI %)
        Diamond Tier: >100ETH and gets back 5% return of ticket sales; 
            whale_tier = diamond 
            ROI = (.05*total_TIX)
        Gold Tier: 50-99 ETH gets 2.5% return of ticket sales.
            whale_tier = gold 
            ROI = (.025*total_TIX)
        Platinum tier: 10-49 ETH gets 1.5% return of ticket sales
            whale_tier = platinum 
            ROI = (.015*total_TIX)
    OR 
    initial_ROI is calculated (before the next draw, variable, based on the number of TIX)
    
     
    2. Whale sends crypto to the lotto_byte in exchange for a stake_ID = 'stake_hash'
    
    function_diamond (tier is categorized)
    stake_amt is num
    if stake_amt > 100 ETH
    then whale_tier = diamond
    print whale_tier

    **transaction is made and stake_ID is generated
    stake_ID = 'stake_hash'   

    function: 
    Information is sent to the lotto_byte dictionary: stake_ID, stake_amt, wallet_address, ETH_balance
    
    function: 
    stake_amt is deposited to the pool_wallet

    3. Whale gets profits  
    **from lotto_byte contract: If no jackpot is won, the whale_wallet gets sent a % of the total pool_wallet deposited 
    whale_wallet_address receives deposit and balance is updated on the UI - how to keep track of each deposit?
    New_ETH_balance = ETH_balance + ROI

    Whale merges with other same tier whales for reinvestment (optional)

    */
    

/*

Implement Ether Management Functions
------------------------------------
In this activity, you’ll extend the `CustomerAccount` contract that you created earlier by implementing functions that will allow you to send remittances and deposit ether.
*/

pragma solidity ^0.5.0;

contract WhaleAccount {
    address owner;
    bool isNewAccount;
//`accountBalance` variable is `public` to allow other users or contracts to access it. Specifically, making this variable public will allow both 
//you and others to check the balance of ether in the contract when depositing or withdrawing ether.
    uint public accountBalance;
    //string customerName; changed to lotteryName
    string lotteryName;
    string customerLastName;
 
    function Lottix_deposit_to_whale() public payable {
        accountBalance = address(this).balance;
    }

    function get_Whale_Info() view public returns(address, bool, uint, string memory, string memory) {
        return (owner, isNewAccount, accountBalance, lotteryName, customerLastName);
    }
 
//Information is sent to the lotto_byte dictionary: stake_ID, stake_amt, wallet_address, ETH_balance
//function set_Whale_Info(address newOwner, bool newAccountStatus, uint newAccountBalance, string memory newCustomerName, string memory newCustomerLastName) public {
    //function set_whale_info(/*address newWhale_wallet, bool newAccountStatus,*/ uint newAccountBalance, string memory new_lottery_Name, string memory new_whale_LastName) public {
    function set_lotto_info(address newWhale_wallet, /*bool newAccountStatus,*/ uint newAccountBalance, string memory new_lottery_Name/*, string memory new_whale_LastName*/) public {
        lotteryName = new_lottery_Name;
        //customerLastName = new_whale_LastName;
        owner = newWhale_wallet;
        //isNewAccount = newAccountStatus;
        accountBalance = newAccountBalance;
        
    }
/*function `sendRemittance` is a withdrawing function that takes ether from the current contract balance. This function should accept a `uint` 
argument named `amount` and an `address payable` argument named `recipient`.

Inside the `sendRemittance` function, call the `transfer` method on the passed `recipient` argument, and specify the `amount` to transfer. Then declare an  `accountBalance` 
variable and set it equal to the balance of the contract. The body of the `sendRemittance` function should resemble the following:

 `this` refers to the smart contract itself. `this` helps distinguish a contract's own balance from any other balance.
*/
  //whale stakes crypto: stake_ID = whaleaccount contract address, amount = stake_amt, recipient = lottix wallet_address, accountBalance = ETH_balance
     function sendRemittance(uint amount, address payable recipient) public {
        recipient.transfer(amount);
        accountBalance = address(this).balance;
    }

//basic fallback function so that the contract can store ether that’s sent from outside the `deposit` function.
    function() external payable {}
}