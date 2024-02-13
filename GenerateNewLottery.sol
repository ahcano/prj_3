// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./ILotteryInterface.sol";

/*EuroJack Contract*/
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

    // Event for logging investment
    event Invested(string package, uint amount);

    constructor() {
    }

    // Function to invest in the lottery
    function invest(string memory _package, uint _amount) public payable {
        require(msg.value == _amount, "Amount mismatch with sent ETH");
        require(_amount > 10 ether && _amount < 15 ether, "Investment must be between 10 and 15 ETH");
        require(keccak256(bytes(_package)) == keccak256(bytes("Orca")), "Invalid package selected");
        lottDigitAmount = 7;
        initialJackpot = _amount;
        treasurycut = 5;
        ticketprice = _amount * 2 / 10000; // 0.0002 * initialJackpot
        lotterycap = 6 * _amount;
        whalepct_before = 75;
        whalepct_half = 80;
        whalepct_after = 95;

        emit Invested(_package, _amount);
    }

    function updateWhaleKey() public {
        WhaleKey = msg.sender;
        ContractKey = address(this);
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
    event Invested(string package, uint amount);

    constructor() {}

    function invest(string memory _package, uint _amount) public payable {
        require(msg.value == _amount, "Amount mismatch with sent ETH");
        require(_amount > 10 ether && _amount < 15 ether, "Investment must be between 10 and 15 ETH");
        require(keccak256(bytes(_package)) == keccak256(bytes("Orca")), "Invalid package selected");
        lottDigitAmount = 7;
        initialJackpot = _amount;
        treasurycut = 5;
        ticketprice = _amount * 2 / 10000;
        lotterycap = 6 * _amount;
        whalepct_before = 75;
        whalepct_half = 80;
        whalepct_after = 95;
        emit Invested(_package, _amount);
    }

    function updateWhaleKey() public {
        WhaleKey = msg.sender;
        ContractKey = address(this);
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
    event Invested(string package, uint amount);
    
    constructor() {}

    function invest(string memory _package, uint _amount) public payable {
        require(msg.value == _amount, "Amount mismatch with sent ETH");
        require(_amount > 10 ether && _amount < 15 ether, "Investment must be between 10 and 15 ETH");
        require(keccak256(bytes(_package)) == keccak256(bytes("Orca")), "Invalid package selected");
        lottDigitAmount = 7;
        initialJackpot = _amount;
        treasurycut = 5;
        ticketprice = _amount * 2 / 10000;
        lotterycap = 6 * _amount;
        whalepct_before = 75;
        whalepct_half = 80;
        whalepct_after = 95;
        emit Invested(_package, _amount);
    }

    function updateWhaleKey() public {
        WhaleKey = msg.sender;
        ContractKey = address(this);
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
    // Event for logging investment
    event Invested(string package, uint amount);

    // Function to invest in the lottery
    function invest(string memory _package, uint _amount) public payable {
        require(msg.value == _amount, "Amount mismatch with sent ETH");
        require(_amount > 5 ether && _amount < 15 ether, "Investment must be between 5 and 15 ETH");
        initialJackpot = _amount;
        lottDigitAmount = 6;
        if (keccak256(bytes(_package)) == keccak256(bytes("Beluga"))) {
            treasurycut = 5;
            ticketprice = _amount / 10000; // 0.0001 * initialJackpot
            lotterycap = 3 * _amount;
            whalepct_before = 75;
            whalepct_half = 90;
            whalepct_after = 95;
        } else if (keccak256(bytes(_package)) == keccak256(bytes("Narwhal"))) {
            treasurycut = 2;
            ticketprice = _amount / 10000; // 0.0001 * initialJackpot
            lotterycap = 5 * _amount;
            whalepct_before = 58;
            whalepct_half = 75;
            whalepct_after = 98;
        } else {
            revert("Invalid package selected");
        }

        emit Invested(_package, _amount);
    }
    function updateWhaleKey() public {

        WhaleKey = msg.sender;
        ContractKey = address(this);
    }

}



/*US Powerball Contract*/
contract USPowerBall is ILottery {
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
    // Event for logging investment
    event Invested(string package, uint amount);

    // Function to invest in the lottery
    function invest(string memory _package, uint _amount) public payable {
        require(msg.value == _amount, "Amount mismatch with sent ETH");
        require(_amount > 5 ether && _amount < 15 ether, "Investment must be between 5 and 15 ETH");
        initialJackpot = _amount;
        lottDigitAmount = 6;
        if (keccak256(bytes(_package)) == keccak256(bytes("Beluga"))) {
            treasurycut = 5;
            ticketprice = _amount / 10000; // 0.0001 * initialJackpot
            lotterycap = 3 * _amount;
            whalepct_before = 75;
            whalepct_half = 90;
            whalepct_after = 95;
        } else if (keccak256(bytes(_package)) == keccak256(bytes("Narwhal"))) {
            treasurycut = 2;
            ticketprice = _amount / 10000; // 0.0001 * initialJackpot
            lotterycap = 5 * _amount;
            whalepct_before = 58;
            whalepct_half = 75;
            whalepct_after = 98;
        } else {
            revert("Invalid package selected");
        }

        emit Invested(_package, _amount);
    }
    function updateWhaleKey() public {

        WhaleKey = msg.sender;
        ContractKey = address(this);
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
    // Event for logging investment
    event Invested(string package, uint amount);

    // Function to invest in the lottery
    function invest(string memory _package, uint _amount) public payable {
        require(msg.value == _amount, "Amount mismatch with sent ETH");
        require(_amount > 5 ether && _amount < 15 ether, "Investment must be between 5 and 15 ETH");
        initialJackpot = _amount;
        lottDigitAmount = 6;
        if (keccak256(bytes(_package)) == keccak256(bytes("Beluga"))) {
            treasurycut = 5;
            ticketprice = _amount / 10000; // 0.0001 * initialJackpot
            lotterycap = 3 * _amount;
            whalepct_before = 75;
            whalepct_half = 90;
            whalepct_after = 95;
        } else if (keccak256(bytes(_package)) == keccak256(bytes("Narwhal"))) {
            treasurycut = 2;
            ticketprice = _amount / 10000; // 0.0001 * initialJackpot
            lotterycap = 5 * _amount;
            whalepct_before = 58;
            whalepct_half = 75;
            whalepct_after = 98;
        } else {
            revert("Invalid package selected");
        }

        emit Invested(_package, _amount);
    }
    function updateWhaleKey() public {

        WhaleKey = msg.sender;
        ContractKey = address(this);
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
    // Event to emit investment details
    event InvestmentDetails(string package, uint amount, uint ticketPrice, uint lotteryCap);

    function invest(string memory package, uint amount) public payable {
        require(msg.value == amount, "Amount mismatch");
        lottDigitAmount = 9;     
        if (keccak256(bytes(package)) == keccak256(bytes("Whale Shark"))) {
            require(amount >= 15 ether && amount <= 50 ether, "Invalid investment amount for Whale Shark");
            initialJackpot = amount;
            ticketprice = 0.0006 ether * amount / 1 ether; // Adjusting for fixed-point arithmetic
            lotterycap = 5 * amount;
            whalepct_before = 20;
            whalepct_half = 60;
            whalepct_after = 90;
        } else if (keccak256(bytes(package)) == keccak256(bytes("Humpback"))) {
            require(amount >= 15 ether && amount <= 80 ether, "Invalid investment amount for Humpback");
            initialJackpot = amount;
            ticketprice = 0.0002 ether * amount / 1 ether; // Adjusting for fixed-point arithmetic
            lotterycap = 25 * amount / 10; // 2.5 * initialJackpot
            whalepct_before = 50;
            whalepct_half = 75;
            whalepct_after = 90;
        } else {
            revert("Invalid package");
        }

        emit InvestmentDetails(package, amount, ticketprice, lotterycap);
    }
    function updateWhaleKey() public {

        WhaleKey = msg.sender;
        ContractKey = address(this);
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
    // Event to emit investment details
    event InvestmentDetails(string package, uint amount, uint ticketprice, uint lotterycap);

    function invest(string memory package, uint amount) public payable {
        require(msg.value == amount, "Amount mismatch");
        lottDigitAmount = 9;    
        if (keccak256(bytes(package)) == keccak256(bytes("Whale Shark"))) {
            require(amount >= 15 ether && amount <= 50 ether, "Invalid investment amount for Whale Shark");
            initialJackpot = amount;
            ticketprice = 0.0006 ether * amount / 1 ether; // Adjusting for fixed-point arithmetic
            lotterycap = 5 * amount;
            whalepct_before = 20;
            whalepct_half = 60;
            whalepct_after = 90;
        } else if (keccak256(bytes(package)) == keccak256(bytes("Humpback"))) {
            require(amount >= 15 ether && amount <= 80 ether, "Invalid investment amount for Humpback");
            initialJackpot = amount;
            ticketprice = 0.0002 ether * amount / 1 ether; // Adjusting for fixed-point arithmetic
            lotterycap = 25 * amount / 10; // 2.5 * initialJackpot
            whalepct_before = 50;
            whalepct_half = 75;
            whalepct_after = 90;
        } else {
            revert("Invalid package");
        }

        emit InvestmentDetails(package, amount, ticketprice, lotterycap);
    }
    function updateWhaleKey() public {

        WhaleKey = msg.sender;
        ContractKey = address(this);
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
    address public WhaleKey;
    address public ContractKey;
    // Assuming the contract's currency is in Wei, and 1 ETH = 1e18 Wei
    uint constant lowerBound = 35 ether;
    uint constant upperBound = 100 ether;

    // Modifier to check the investment amount
    modifier validInvestment(uint _amount) {
        require(_amount >= lowerBound && _amount <= upperBound, "Investment must be between 35 and 100 ETH");
        _;
    }

    function investInLottery(string memory package, uint _amount) public validInvestment(_amount) {
        initialJackpot = _amount;
        lottDigitAmount = 12;
        if (keccak256(bytes(package)) == keccak256(bytes("Grey Whale"))) {
            treasurycut = 25;
            ticketprice = 500 * initialJackpot / 1 ether; // 0.0005 * initialJackpot
            lotterycap = 5 * initialJackpot;
            whalepct_before = 20;
            whalepct_half = 35;
            whalepct_after = 75;
        } else if (keccak256(bytes(package)) == keccak256(bytes("Blue Whale"))) {
            treasurycut = 10;
            ticketprice = 500 * initialJackpot / 1 ether; // 0.0005 * initialJackpot
            lotterycap = 10 * initialJackpot;
            whalepct_before = 25;
            whalepct_half = 50;
            whalepct_after = 90;
        } else {
            revert("Invalid package selected");
        }
    }

    function updateWhaleKey() public {

        WhaleKey = msg.sender;
        ContractKey = address(this);
    }
}


