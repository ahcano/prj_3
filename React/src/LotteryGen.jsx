import React from 'react';

// Example lottery data structure
const lotteries = [
  {
    name: "Enalotto",
    packages: [
      {
        packageName: "Beluga",
        digits: 6,
        treasuryCut: 5, // Percentage
        ticketPrice: "0.1% Initial Jackpot",
        cap: "300% Initial Jackpot",
        stakeRange: "5 - 15 ETH",
        percentages: {
          beforeHalfCap: 75,
          afterHalfCap: 90,
          atMaxCap: 95}
      },
      {
        packageName: "Narwhal",
        digits: 6,
        treasuryCut: 2, // Percentage
        ticketPrice: "0.1% Initial Jackpot",
        cap: "500% Initial Jackpot",
        stakeRange: "5 - 15 ETH",
        percentages: {
          beforeHalfCap: 58,
          afterHalfCap: 75,
          atMaxCap: 98}
      }
    ],
  },  
  {
    name: "MegaMil",
    packages: [
      {
        packageName: "Beluga",
        digits: 6,
        treasuryCut: 5, // Percentage
        ticketPrice: "0.1% Initial Jackpot",
        cap: "300% Initial Jackpot",
        stakeRange: "5 - 15 ETH",
        percentages: {
          beforeHalfCap: 75,
          afterHalfCap: 90,
          atMaxCap: 95}
      },
      {
        packageName: "Narwhal",
        digits: 6,
        treasuryCut: 2, // Percentage
        ticketPrice: "0.1% Initial Jackpot",
        cap: "500% Initial Jackpot",
        stakeRange: "5 - 15 ETH",
        percentages: {
          beforeHalfCap: 58,
          afterHalfCap: 75,
          atMaxCap: 98}
      }
    ],
  },
  {
    name: "USPB",
    packages: [
      {
        packageName: "Beluga",
        digits: 6,
        treasuryCut: 5, // Percentage
        ticketPrice: "0.1% Initial Jackpot",
        cap: "300% Initial Jackpot",
        stakeRange: "5 - 15 ETH",
        percentages: {
          beforeHalfCap: 75,
          afterHalfCap: 90,
          atMaxCap: 95}
      },
      {
        packageName: "Narwhal",
        digits: 6,
        treasuryCut: 2, // Percentage
        ticketPrice: "0.1% Initial Jackpot",
        cap: "500% Initial Jackpot",
        stakeRange: "5 - 15 ETH",
        percentages: {
          beforeHalfCap: 58,
          afterHalfCap: 75,
          atMaxCap: 98}
      }
    ],
  },
  {
    name: "AUPB",
    packages: [
      {
        packageName: "Orca",
        digits: 7,
        treasuryCut: 5, // Percentage
        ticketPrice: "0.2% Initial Jackpot",
        cap: "600% Initial Jackpot",
        stakeRange: "10 - 15 ETH",
        percentages: {
          beforeHalfCap: 75,
          afterHalfCap: 80,
          atMaxCap: 95}
      }
    ],
  },
  {
    name: "EuroJack",
    packages: [
      {
        packageName: "Orca",
        digits: 7,
        treasuryCut: 5,
        ticketPrice: "0.2% Initial Jackpot",
        cap: "600% Initial Jackpot",
        stakeRange: "10 - 15 ETH",
        percentages: { beforeHalfCap: 75, afterHalfCap: 80, atMaxCap: 95 }
      }
    ],
  },

  {
    name: "Lot649",
    packages: [
      {
        packageName: "Orca",
        digits: 7,
        treasuryCut: 5, // Percentage
        ticketPrice: "0.2% Initial Jackpot",
        cap: "600% Initial Jackpot",
        stakeRange: "10 - 15 ETH",
        percentages: {
          beforeHalfCap: 75,
          afterHalfCap: 80,
          atMaxCap: 95}
      }
    ],
  },  

  {
    name: "LottMaxx",
    packages: [
      {
        packageName: "Whale Shark",
        digits: 9,
        treasuryCut: 10, // Percentage
        ticketPrice: "0.6% Initial Jackpot",
        cap: "500% Initial Jackpot",
        stakeRange: "15 - 50 ETH",
        percentages: {
          beforeHalfCap: 20,
          afterHalfCap: 60,
          atMaxCap: 90}
      },
      {
        packageName: "Humpback",
        digits: 9,
        treasuryCut: 10, // Percentage
        ticketPrice: "0.2% Initial Jackpot",
        cap: "2500% Initial Jackpot",
        stakeRange: "15 - 50 ETH",
        percentages: {
          beforeHalfCap: 50,
          afterHalfCap: 75,
          atMaxCap: 90}
      }
    ],
  },

  {
    name: "OzLott",
    packages: [
      {
        packageName: "Whale Shark",
        digits: 9,
        treasuryCut: 10, // Percentage
        ticketPrice: "0.6% Initial Jackpot",
        cap: "500% Initial Jackpot",
        stakeRange: "15 - 50 ETH",
        percentages: {
          beforeHalfCap: 20,
          afterHalfCap: 60,
          atMaxCap: 90}
      },
      {
        packageName: "Humpback",
        digits: 9,
        treasuryCut: 10, // Percentage
        ticketPrice: "0.2% Initial Jackpot",
        cap: "2500% Initial Jackpot",
        stakeRange: "15 - 50 ETH",
        percentages: {
          beforeHalfCap: 50,
          afterHalfCap: 75,
          atMaxCap: 90}
      }
    ],
  },

  {
    name: "EurMil",
    packages: [
      {
        packageName: "Grey Whale",
        digits: 12,
        treasuryCut: 25, // Percentage
        ticketPrice: "0.5% Initial Jackpot",
        cap: "500 ETH",
        stakeRange: "35 - 100 ETH",
        percentages: {
          beforeHalfCap: 20,
          afterHalfCap: 35,
          atMaxCap: 75}
      },
      {
        packageName: "Blue Whale",
        digits: 12,
        treasuryCut: 10, // Percentage
        ticketPrice: "0.5% Initial Jackpot",
        cap: "1000 ETH",
        stakeRange: "35 - 100 ETH",
        percentages: {
          beforeHalfCap: 25,
          afterHalfCap: 50,
          atMaxCap: 90}
      }
    ],
  },
];
  
const LotteryInfoPage = () => {
  return (
    <div style={{ padding: '20px' }}>
      {lotteries.map((lottery, index) => (
        <div key={index} className="cardStyle">
          <h2>{lottery.name}</h2>
          {lottery.packages.map((pack, packIndex) => (
            <div key={`${index}-${packIndex}`}>
              <h3>{pack.packageName} Package</h3>
              <table>
                <tbody>
                  <tr><td>Lottery Digits:</td><td>{pack.digits}</td></tr>
                  <tr><td>Lottix Fee:</td><td>{pack.treasuryCut}%</td></tr>
                  <tr><td>Ticket Price:</td><td>{pack.ticketPrice}</td></tr>
                  <tr><td>Jackpot Cap:</td><td>{pack.cap}</td></tr>
                  <tr><td>Amount Required:</td><td>{pack.stakeRange}</td></tr>
                  <tr><td>Dividends:</td><td>Before Half Cap: {pack.percentages.beforeHalfCap}%, After Half Cap: {pack.percentages.afterHalfCap}%, At Max Cap: {pack.percentages.atMaxCap}%</td></tr>
                </tbody>
              </table>
              <button className="generateLotteryBtn" onClick>Generate Lottery</button>
            </div>
          ))}
        </div>
      ))}
    </div>
  );
};

export default LotteryInfoPage;