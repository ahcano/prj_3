// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./ILotteryInterface.sol";
import "./IWhaleInterface.sol";
import "./TixInterface.sol";
import "./TIXMinter.sol";
import "./WhaleContract.sol";

/*EuroJack Lottery Type Contract*/
contract EuroJack is ILottery{
    uint public initialJackpot;
    uint public treasurycut;
    uint public ticketprice;
    uint public lotterycap;
    uint public whalepct_before;
    uint public whalepct_half;
    uint public whalepct_after;
    uint public lottDigitAmount;
    address public WhaleKey;
    address public ContractKey;
    address payable public PoolKey;
    mapping(address => address payable[]) public whaleToPoolKeys;
    //WhaleAccount whaleAccount;
    IWhale whaleConnect;
    //ITIX crowdsaleminter;

    // Event for logging investment
    event Invested(string package, address wallet_adress, uint amount, address payable PoolKey);

    constructor() {
        whaleConnect = IWhale(0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8);
        //crowdsaleminter = ITIX(0xd9145CCE52D386f254917e481eB44e9943F39138);
        //WhaleAccount = whaleAccount();
    }

    // Function to generate a new Lottery by investing
    function invest(string memory _package, uint _amount) public payable {

        // Collect the payment for making a new Lottery
        require(msg.value == _amount, "Amount mismatch with sent ETH");
        require(_amount > 10 ether && _amount < 15 ether, "Investment must be between 10 and 15 ETH");

        //Collect the Whale Package Selection
        require(keccak256(bytes(_package)) == keccak256(bytes("Orca")), "Invalid package selected");

        // Variables Based on Lottery and Package Selection
        lottDigitAmount = 7;
        initialJackpot = _amount;
        treasurycut = 5;
        ticketprice = (_amount * 2 / 10000); // 0.0002 * initialJackpot converted to Wei
        lotterycap = 6 * _amount;
        whalepct_before = 75;
        whalepct_half = 80;
        whalepct_after = 95;
        WhaleKey = msg.sender;
        ContractKey = address(this);
        
        // Import other secret variables from 'WhaleContract.sol' using the WhaleConnect Interface
        whaleConnect.setFactoryDetails();
        

        /* GENERATE NEW LOTTERY AND SAVE 'POOL KEY'*/
        PoolKey = whaleConnect.generateLottery(
        ticketprice,
        ContractKey,
        lottDigitAmount,
        0xd9145CCE52D386f254917e481eB44e9943F39138);

        // Add the new PoolKey to the array for the WhaleKey
        whaleToPoolKeys[WhaleKey].push(PoolKey);

        // Forward the ETH to the newly generated PoolKey
        (bool sent, ) = PoolKey.call{value: msg.value}("");
        require(sent, "Failed to send Ether to the PoolKey");

        // Mint and Deploy TIX to the PoolKey
        //crowdsaleminter.batchmint(whaleAccount.lotteryAddresses, 100000);

        emit Invested(_package, msg.sender, _amount, PoolKey);

    }
}

/*Lotto649*/
contract Lot649 is ILottery{
    uint public initialJackpot;
    uint public treasurycut;
    uint public ticketprice;
    uint public lotterycap;
    uint public whalepct_before;
    uint public whalepct_half;
    uint public whalepct_after;
    uint public lottDigitAmount;
    address public WhaleKey;
    address public ContractKey;
    address payable public PoolKey;
    mapping(address => address payable[]) public whaleToPoolKeys;
    IWhale whaleConnect;

    // Event for logging investment
    event Invested(string package, address wallet_adress, uint amount, address payable PoolKey);

    constructor() {
        whaleConnect = IWhale(0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8);
    }

    
    // Function to generate a new Lottery by investing
    function invest(string memory _package, uint _amount) public payable {
        // Collect the payment for making a new Lottery
        require(msg.value == _amount, "Amount mismatch with sent ETH");
        require(_amount > 10 ether && _amount < 15 ether, "Investment must be between 10 and 15 ETH");
        // Collect Whale Package Selection 
        require(keccak256(bytes(_package)) == keccak256(bytes("Orca")), "Invalid package selected");

        // Variables Based on Lottery and Package Selection
        lottDigitAmount = 7;
        initialJackpot = _amount;
        treasurycut = 5;
        ticketprice = _amount * 2 / 10000;
        lotterycap = 6 * _amount;
        whalepct_before = 75;
        whalepct_half = 80;
        whalepct_after = 95;
        WhaleKey = msg.sender;
        ContractKey = address(this);

        // Import other secret variables from 'WhaleContract.sol' using the WhaleConnect Interface
        whaleConnect.setFactoryDetails();

        /* GENERATE NEW LOTTERY AND SAVE 'POOL KEY'*/
        PoolKey = whaleConnect.generateLottery(
        ticketprice,
        ContractKey,
        lottDigitAmount,
        0xd9145CCE52D386f254917e481eB44e9943F39138);

        // Add the new PoolKey to the array for the WhaleKey
        whaleToPoolKeys[WhaleKey].push(PoolKey);

        // Forward the ETH to the newly generated PoolKey
        (bool sent, ) = PoolKey.call{value: msg.value}("");
        require(sent, "Failed to send Ether to the PoolKey");

        emit Invested(_package, msg.sender, _amount, PoolKey);
    }
}


/*AU Powerball Contract*/
contract AUPowerball is ILottery {
    uint public initialJackpot;
    uint public treasurycut;
    uint public ticketprice;
    uint public lotterycap;
    uint public whalepct_before;
    uint public whalepct_half;
    uint public whalepct_after;
    uint public lottDigitAmount;
    address public WhaleKey;
    address public ContractKey;
    address payable public PoolKey;
    mapping(address => address payable[]) public whaleToPoolKeys;
    IWhale whaleConnect;

    // Event for logging investment
    event Invested(string package, address wallet_adress, uint amount, address payable PoolKey);
    
    constructor() {
        whaleConnect = IWhale(0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8);
    }
    // Function to generate a new Lottery by investing  
    function invest(string memory _package, uint _amount) public payable {
        // Collect the payment for making a new Lottery
        require(msg.value == _amount, "Amount mismatch with sent ETH");
        require(_amount > 10 ether && _amount < 15 ether, "Investment must be between 10 and 15 ETH");
        // Collect Whale Package Selection 
        require(keccak256(bytes(_package)) == keccak256(bytes("Orca")), "Invalid package selected");

        // Variables Based on Lottery and Package Selection
        lottDigitAmount = 7;
        initialJackpot = _amount;
        treasurycut = 5;
        ticketprice = _amount * 2 / 10000;
        lotterycap = 6 * _amount;
        whalepct_before = 75;
        whalepct_half = 80;
        whalepct_after = 95;
        WhaleKey = msg.sender;
        ContractKey = address(this);

        // Import other secret variables from 'WhaleContract.sol' using the WhaleConnect Interface
        whaleConnect.setFactoryDetails();

        /* GENERATE NEW LOTTERY AND SAVE 'POOL KEY'*/
        PoolKey = whaleConnect.generateLottery(
        ticketprice,
        ContractKey,
        lottDigitAmount,
        0xd9145CCE52D386f254917e481eB44e9943F39138);

        // Add the new PoolKey to the array for the WhaleKey
        whaleToPoolKeys[WhaleKey].push(PoolKey);

        // Forward the ETH to the newly generated PoolKey
        (bool sent, ) = PoolKey.call{value: msg.value}("");
        require(sent, "Failed to send Ether to the PoolKey");

        emit Invested(_package, msg.sender, _amount, PoolKey);
    }
}


/*Super Enalotto Contract*/
contract Enalotto is ILottery{
    uint public initialJackpot;
    uint public treasurycut;
    uint public ticketprice;
    uint public lotterycap;
    uint public whalepct_before;
    uint public whalepct_half;
    uint public whalepct_after;
    uint public lottDigitAmount;
    address public WhaleKey;
    address public ContractKey;
    address payable public PoolKey;
    mapping(address => address payable[]) public whaleToPoolKeys;
    IWhale whaleConnect;

    // Event for logging investment
    event Invested(string package, address wallet_adress, uint amount, address payable PoolKey);

    constructor() {
        whaleConnect = IWhale(0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8);
    }

    // Function to generate new Lottery by investing
    function invest(string memory _package, uint _amount) public payable {
        // Collect the payment for making a new Lottery
        require(msg.value == _amount, "Amount mismatch with sent ETH");
        require(_amount > 5 ether && _amount < 15 ether, "Investment must be between 5 and 15 ETH");

        // Set variables
        initialJackpot = _amount;
        lottDigitAmount = 6;

        //Use if statement to collect their Whale Package and set variables based on selection
        if (keccak256(bytes(_package)) == keccak256(bytes("Beluga"))) {
            treasurycut = 5;
            ticketprice = _amount / 10000; // 0.0001 * initialJackpot
            lotterycap = 3 * _amount;
            whalepct_before = 75;
            whalepct_half = 90;
            whalepct_after = 95;
            WhaleKey = msg.sender;
            ContractKey = address(this);
        } else if (keccak256(bytes(_package)) == keccak256(bytes("Narwhal"))) {
            treasurycut = 2;
            ticketprice = _amount / 10000; // 0.0001 * initialJackpot
            lotterycap = 5 * _amount;
            whalepct_before = 58;
            whalepct_half = 75;
            whalepct_after = 98;
            WhaleKey = msg.sender;
            ContractKey = address(this);
        } else {
            revert("Invalid package selected");
        }

        // Import other secret variables from 'WhaleContract.sol' using the WhaleConnect Interface
        whaleConnect.setFactoryDetails();

        /* GENERATE NEW LOTTERY AND SAVE 'POOL KEY'*/
        PoolKey = whaleConnect.generateLottery(
        ticketprice,
        ContractKey,
        lottDigitAmount,
        0xd9145CCE52D386f254917e481eB44e9943F39138);

        // Add the new PoolKey to the array for the WhaleKey
        whaleToPoolKeys[WhaleKey].push(PoolKey);

        // Forward the ETH to the newly generated PoolKey
        (bool sent, ) = PoolKey.call{value: msg.value}("");
        require(sent, "Failed to send Ether to the PoolKey");

        emit Invested(_package, msg.sender, _amount, PoolKey);
    }
}



/*US Powerball Contract*/
contract USPowerBall is ILottery {
    uint public initialJackpot;
    uint public treasurycut;
    uint public ticketprice;
    uint public tickPrice;
    uint public lotterycap;
    uint public whalepct_before;
    uint public whalepct_half;
    uint public whalepct_after;
    uint public lottDigitAmount;
    address public WhaleKey;
    address public ContractKey;
    address payable public PoolKey;
    mapping(address => address payable[]) public whaleToPoolKeys;
    IWhale whaleConnect;

    // Event for logging investment
    event Invested(string package, address wallet_adress, uint amount, address payable PoolKey);

    constructor() {
        whaleConnect = IWhale(0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8);
    }


    // Function to generate new Lottery by investing
    function invest(string memory _package, uint _amount) public payable {
        // Collect the payment for making a new Lottery
        require(msg.value == _amount, "Amount mismatch with sent ETH");
        require(_amount > 5 ether && _amount < 15 ether, "Investment must be between 5 and 15 ETH");

        // Set variables
        initialJackpot = _amount;
        lottDigitAmount = 6;

        //Use if statement to collect their Whale Package and set variables based on selection
        if (keccak256(bytes(_package)) == keccak256(bytes("Beluga"))) {
            treasurycut = 5;
            ticketprice = _amount / 10000; // 0.0001 * initialJackpot
            lotterycap = 3 * _amount;
            whalepct_before = 75;
            whalepct_half = 90;
            whalepct_after = 95;
            WhaleKey = msg.sender;
            ContractKey = address(this);
        } else if (keccak256(bytes(_package)) == keccak256(bytes("Narwhal"))) {
            treasurycut = 2;
            ticketprice = _amount / 10000; // 0.0001 * initialJackpot
            lotterycap = 5 * _amount;
            whalepct_before = 58;
            whalepct_half = 75;
            whalepct_after = 98;
            WhaleKey = msg.sender;
            ContractKey = address(this);
        } else {
            revert("Invalid package selected");
        }

        // Import other secret variables from 'WhaleContract.sol' using the WhaleConnect Interface
        whaleConnect.setFactoryDetails();

        tickPrice = ticketprice * 1e18;

        /* GENERATE NEW LOTTERY AND SAVE 'POOL KEY'*/
        PoolKey = whaleConnect.generateLottery(
        ticketprice,
        ContractKey,
        lottDigitAmount,
        0xd9145CCE52D386f254917e481eB44e9943F39138);

        // Add the new PoolKey to the array for the WhaleKey
        whaleToPoolKeys[WhaleKey].push(PoolKey);

        // Forward the ETH to the newly generated PoolKey
        (bool sent, ) = PoolKey.call{value: msg.value}("");
        require(sent, "Failed to send Ether to the PoolKey");

        emit Invested(_package, msg.sender, _amount, PoolKey);
    }
}

/*MegaMillions Contract*/
contract MegaMil is ILottery {
    uint public initialJackpot;
    uint public treasurycut;
    uint public ticketprice;
    uint public lotterycap;
    uint public whalepct_before;
    uint public whalepct_half;
    uint public whalepct_after;
    uint public lottDigitAmount;
    address public WhaleKey;
    address public ContractKey;
    address payable public PoolKey;
    mapping(address => address payable[]) public whaleToPoolKeys;
    IWhale whaleConnect;

    // Event for logging investment
    event Invested(string package, address wallet_adress, uint amount, address payable PoolKey);

    constructor() {
        whaleConnect = IWhale(0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8);
    }

    // Function to generate new Lottery by investing
    function invest(string memory _package, uint _amount) public payable {
        // Collect the payment for making a new Lottery
        require(msg.value == _amount, "Amount mismatch with sent ETH");
        require(_amount >= 5 ether && _amount <= 15 ether, "Investment must be between 5 and 15 ETH");

        // Set variables
        initialJackpot = _amount;
        lottDigitAmount = 6;

        //Use if statement to collect their Whale Package and set variables based on selection
        if (keccak256(bytes(_package)) == keccak256(bytes("Beluga"))) {
            treasurycut = 5;
            ticketprice = _amount / 10000; // 0.0001 * initialJackpot
            lotterycap = 3 * _amount;
            whalepct_before = 75;
            whalepct_half = 90;
            whalepct_after = 95;
            WhaleKey = msg.sender;
            ContractKey = address(this);
        } else if (keccak256(bytes(_package)) == keccak256(bytes("Narwhal"))) {
            treasurycut = 2;
            ticketprice = _amount / 10000; // 0.0001 * initialJackpot
            lotterycap = 5 * _amount;
            whalepct_before = 58;
            whalepct_half = 75;
            whalepct_after = 98;
            WhaleKey = msg.sender;
            ContractKey = address(this);
        } else {
            revert("Invalid package selected");
        }

        // Import other secret variables from 'WhaleContract.sol' using the WhaleConnect Interface
        whaleConnect.setFactoryDetails();

        /* GENERATE NEW LOTTERY AND SAVE 'POOL KEY'*/
        PoolKey = whaleConnect.generateLottery(
        ticketprice,
        ContractKey,
        lottDigitAmount,
        0xd9145CCE52D386f254917e481eB44e9943F39138);

        // Add the new PoolKey to the array for the WhaleKey
        whaleToPoolKeys[WhaleKey].push(PoolKey);

        // Forward the ETH to the newly generated PoolKey
        (bool sent, ) = PoolKey.call{value: msg.value}("");
        require(sent, "Failed to send Ether to the PoolKey");



        emit Invested(_package, msg.sender, _amount, PoolKey);
    }
}


/*LottoMax CONTRACT*/
contract LottMaxx is ILottery {
    uint public initialJackpot;
    uint public treasurycut;
    uint public ticketprice;
    uint public lotterycap;
    uint public whalepct_before;
    uint public whalepct_half;
    uint public whalepct_after;
    uint public lottDigitAmount;
    address public WhaleKey;
    address public ContractKey;
    address payable public PoolKey;
    mapping(address => address payable[]) public whaleToPoolKeys;
    IWhale whaleConnect;

    // Event for logging investment
    event Invested(string package, address wallet_adress, uint amount, address payable PoolKey);

    constructor() {
        whaleConnect = IWhale(0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8);
    }
    // Function to generate new Lottery by investing
    function invest(string memory package, uint amount) public payable {
        // Collect the payment for making a new Lottery
        require(msg.value == amount, "Amount mismatch");
        // Set the DigitAmount for guesses
        lottDigitAmount = 9;     

        //Use if statement to collect their Whale Package and set variables based on selection
        if (keccak256(bytes(package)) == keccak256(bytes("Whale Shark"))) {
            require(amount >= 15 ether && amount <= 50 ether, "Invalid investment amount for Whale Shark");
            initialJackpot = amount;
            treasurycut = 10;
            ticketprice = 0.0006 ether * amount / 1 ether; // Adjusting for fixed-point arithmetic
            lotterycap = 5 * amount;
            whalepct_before = 20;
            whalepct_half = 60;
            whalepct_after = 90;
            WhaleKey = msg.sender;
            ContractKey = address(this);
        } else if (keccak256(bytes(package)) == keccak256(bytes("Humpback"))) {
            require(amount >= 15 ether && amount <= 80 ether, "Invalid investment amount for Humpback");
            initialJackpot = amount;
            treasurycut = 10;
            ticketprice = 0.0002 ether * amount / 1 ether; // Adjusting for fixed-point arithmetic
            lotterycap = 25 * amount / 10; // 2.5 * initialJackpot
            whalepct_before = 50;
            whalepct_half = 75;
            whalepct_after = 90;
            WhaleKey = msg.sender;
            ContractKey = address(this);
        } else {
            revert("Invalid package");
        }

        // Import other secret variables from 'WhaleContract.sol' using the WhaleConnect Interface
        whaleConnect.setFactoryDetails();

        /* GENERATE NEW LOTTERY AND SAVE 'POOL KEY'*/
        PoolKey = whaleConnect.generateLottery(
        ticketprice,
        ContractKey,
        lottDigitAmount,
        0xd9145CCE52D386f254917e481eB44e9943F39138);

        // Add the new PoolKey to the array for the WhaleKey
        whaleToPoolKeys[WhaleKey].push(PoolKey);

        // Forward the ETH to the newly generated PoolKey
        (bool sent, ) = PoolKey.call{value: msg.value}("");
        require(sent, "Failed to send Ether to the PoolKey");

        emit Invested(package, msg.sender, amount, PoolKey);
    }
}
/*OZ LOTTO CONTRACT*/
contract OzLott is ILottery{
    uint public initialJackpot;
    uint public treasurycut;
    uint public ticketprice;
    uint public lotterycap;
    uint public whalepct_before;
    uint public whalepct_half;
    uint public whalepct_after;
    uint public lottDigitAmount;
    address public WhaleKey;
    address public ContractKey;
    address payable public PoolKey;
    mapping(address => address payable[]) public whaleToPoolKeys;
    IWhale whaleConnect;

    // Event for logging investment
    event Invested(string package, address wallet_adress, uint amount, address payable PoolKey);

    constructor() {
        whaleConnect = IWhale(0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8);
    }
    // Function to generate new Lottery by investing
    function invest(string memory package, uint amount) public payable {

        // Collect the payment for making a new Lottery
        require(msg.value == amount, "Amount mismatch");
        // Set the DigitAmount for guesses
        lottDigitAmount = 9;     

        //Use if statement to collect their Whale Package and set variables based on selection
        if (keccak256(bytes(package)) == keccak256(bytes("Whale Shark"))) {
            require(amount >= 15 ether && amount <= 50 ether, "Invalid investment amount for Whale Shark");
            initialJackpot = amount;
            ticketprice = 0.0006 ether * amount / 1 ether; // Adjusting for fixed-point arithmetic
            lotterycap = 5 * amount;
            treasurycut = 10;
            whalepct_before = 20;
            whalepct_half = 60;
            whalepct_after = 90;
            WhaleKey = msg.sender;
            ContractKey = address(this);
        } else if (keccak256(bytes(package)) == keccak256(bytes("Humpback"))) {
            require(amount >= 15 ether && amount <= 80 ether, "Invalid investment amount for Humpback");
            initialJackpot = amount;
            treasurycut = 10;
            ticketprice = 0.0002 ether * amount / 1 ether; // Adjusting for fixed-point arithmetic
            lotterycap = 25 * amount / 10; // 2.5 * initialJackpot
            whalepct_before = 50;
            whalepct_half = 75;
            whalepct_after = 90;
            WhaleKey = msg.sender;
            ContractKey = address(this);
        } else {
            revert("Invalid package");
        }

        // Import other secret variables from 'WhaleContract.sol' using the WhaleConnect Interface
        whaleConnect.setFactoryDetails();

        /* GENERATE NEW LOTTERY AND SAVE 'POOL KEY'*/
        PoolKey = whaleConnect.generateLottery(
        ticketprice,
        ContractKey,
        lottDigitAmount,
        0xd9145CCE52D386f254917e481eB44e9943F39138);

        // Add the new PoolKey to the array for the WhaleKey
        whaleToPoolKeys[WhaleKey].push(PoolKey);

        // Forward the ETH to the newly generated PoolKey
        (bool sent, ) = PoolKey.call{value: msg.value}("");
        require(sent, "Failed to send Ether to the PoolKey");

        emit Invested(package, msg.sender, amount, PoolKey);
    }
}


/*EUROMILLIONS LOTTERY CONTRACT*/
contract EurMil is ILottery{
    uint public initialJackpot;
    uint public treasurycut;
    uint public ticketprice;
    uint public lotterycap;
    uint public whalepct_before;
    uint public whalepct_half;
    uint public whalepct_after;
    uint public lottDigitAmount;
    uint public tickPrice;
    address public WhaleKey;
    address public ContractKey;
    address payable public PoolKey;
    mapping(address => address payable[]) public whaleToPoolKeys;
    IWhale whaleConnect;

    // Event for logging investment
    event Invested(string package, address wallet_adress, uint amount, address payable PoolKey);

    constructor() {
        whaleConnect = IWhale(0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8);
    }
    // Assuming the contract's currency is in Wei, and 1 ETH = 1e18 Wei
    uint constant lowerBound = 35 ether;
    uint constant upperBound = 100 ether;


    // Modifier to check the investment amount
    modifier validInvestment(uint _amount) {
        require(_amount >= lowerBound && _amount <= upperBound, "Investment must be between 35 and 100 ETH");
        _;
    }

    // Function to generate new Lottery by investing
    function investInLottery(string memory package, uint _amount) public payable validInvestment(_amount) {
        //Set Initial Variables
        initialJackpot = _amount;
        lottDigitAmount = 12;

        //Use if statement to collect their Whale Package and set variables based on selection
        if (keccak256(bytes(package)) == keccak256(bytes("Grey Whale"))) {
            treasurycut = 25;
            ticketprice = 500 * initialJackpot / 1 ether; // 0.0005 * initialJackpot
            lotterycap = 5 * initialJackpot;
            whalepct_before = 20;
            whalepct_half = 35;
            whalepct_after = 75;
            WhaleKey = msg.sender;
            ContractKey = address(this);
        } else if (keccak256(bytes(package)) == keccak256(bytes("Blue Whale"))) {
            treasurycut = 10;
            ticketprice = 500 * initialJackpot / 1 ether; // 0.0005 * initialJackpot
            lotterycap = 10 * initialJackpot;
            whalepct_before = 25;
            whalepct_half = 50;
            whalepct_after = 90;
            WhaleKey = msg.sender;
            ContractKey = address(this);
        } else {
            revert("Invalid package selected");
        }
        // Import other secret variables from 'WhaleContract.sol' using the WhaleConnect Interface
        whaleConnect.setFactoryDetails();

        tickPrice = ticketprice * 1e18;

        /* GENERATE NEW LOTTERY AND SAVE 'POOL KEY'*/
        PoolKey = whaleConnect.generateLottery(
        tickPrice,
        ContractKey,
        lottDigitAmount,
        0xd9145CCE52D386f254917e481eB44e9943F39138);

        // Add the new PoolKey to the array for the WhaleKey
        whaleToPoolKeys[WhaleKey].push(PoolKey);

        // Forward the ETH to the newly generated PoolKey
        (bool sent, ) = PoolKey.call{value: msg.value}("");
        require(sent, "Failed to send Ether to the PoolKey");

        emit Invested(package, msg.sender, _amount, PoolKey);
    }
}


