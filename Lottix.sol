pragma solidity ^0.8.0;
/* Import These Contracts and Functions from OpenZeppelin*/

// SPDX-License-Identifier: MIT
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Address.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./TIXMinter.sol";



/*Define the TimeCrowdsale Contract and its variable components*/
contract TimeCrowdsale is Ownable, ReentrancyGuard, Pausable {
    using SafeMath for uint256;
    using Counters for Counters.Counter;
    using Address for address payable;
/*METADATA*/
    uint256 public tickPrice;
    uint256 public whalePercentage;
    uint256 public treasuryCut;
    uint256 public lottDigitAmount;
    uint256 public openingTime;
    uint256 public closingTime;
    address public lotteryPoolWallet;
    uint256 public initialJackpot;
    string public lottName;
    IERC20 public token;

    // Mapping guesses to wallet addresses
    mapping(address => uint256[]) public lotteryGuesses;

    // Counting each guess a user makes on a lottery
    uint256 private _guessCount;

    // Event for ticket purchase
    event TicketPurchased(address participant, uint256[] guesses);

    //Constructor with all the required parameters
constructor(
    address initialOwner,
    uint256 _tickPrice,
    uint256 _whalePercentage,
    uint256 _treasuryCut,
    uint256 _lottDigitAmount,
    uint256 _openingTime,
    uint256 _closingTime,
    uint256 _initialJackpot,
    address _token,
    address _lotteryPoolWallet,
    string memory _lottName
) Ownable(initialOwner) { // Correctly pass initialOwner to the Ownable constructor
    tickPrice = _tickPrice;
    whalePercentage = _whalePercentage;
    treasuryCut = _treasuryCut;
    lottDigitAmount = _lottDigitAmount;
    openingTime = _openingTime;
    closingTime = _closingTime;
    initialJackpot = _initialJackpot;
    token = IERC20(_token);
    lotteryPoolWallet = _lotteryPoolWallet;
    lottName = _lottName;
}


    //Check if the crowdsale is open
    modifier onlyWhileOpen() {
        require(block.timestamp >= openingTime && block.timestamp <= closingTime, "Crowdsale is not open");
        _;
    }

    // Define a function for buying tickets and choosing lottery numbers
    function purchaseTickets(uint256[] calldata guesses) external payable onlyWhileOpen nonReentrant whenNotPaused {
        require(guesses.length == lottDigitAmount, "Invalid number of digits");
        require(msg.value >= tickPrice, "Insufficient funds");


        // Distribute payments using basis points for percentages
        uint256 whaleAmount = tickPrice.mul(whalePercentage).div(10000); // Use 10000 for basis point calculation
        uint256 treasuryAmount = tickPrice.mul(treasuryCut).div(100); // Assuming treasuryCut is still a percentage
        uint256 poolAmount = tickPrice.sub(whaleAmount).sub(treasuryAmount);


        // Transfer amounts
        payable(owner()).transfer(whaleAmount);
        payable(address(this)).transfer(treasuryAmount);
        payable(lotteryPoolWallet).transfer(poolAmount);

        // Save lottery guesses
        lotteryGuesses[msg.sender] = guesses;

        // Guess Counter Goes Up By 1
        _guessCount++;

        emit TicketPurchased(msg.sender, guesses); // Run the Event 'LotteryGuess'
    }

    //Define a function to retrieve the number of time someone has guessed on this lottery
    function totalGuesses() public view returns (uint256) {
        return _guessCount;
    }

    // Define a function to check if the crowdsale is open
    function isOpen() public view returns (bool) {
        return block.timestamp >= openingTime && block.timestamp <= closingTime;
    }




/* ADMIN FUNCTIONS */


    // Function to withdraw tokens accidentally sent to the contract
    function withdrawTokens(address _token, address _to, uint256 _amount) external onlyOwner {
        require(_to != address(0), "Invalid address");
        IERC20(_token).transfer(_to, _amount);
    }

    // Function to withdraw Ether from the contract
    function withdrawEther(address payable _to, uint256 _amount) external onlyOwner {
        require(_to != address(0), "Invalid address");
        require(address(this).balance >= _amount, "Insufficient balance");
        _to.sendValue(_amount);
    }

    // Fallback function to receive Ether
    receive() external payable {}
}
