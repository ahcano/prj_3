// Marketplace.js
import React, { useState } from 'react';
import LotteryCard from './LotteryCard';
import NewGuessForm from './NewGuessForm';

const Marketplace = () => {
    const [showForm, setShowForm] = useState(false);
    const [selectedLotteryIndex, setSelectedLotteryIndex] = useState(null);
    const [activeLotteries, setActiveLotteries] = useState([
        {
            name: 'Lotto 1313',
            digits: 7,
            isOpen: true,
            grandPrize: '10 ETH',
            ticketPrice: '0.02 ETH',
            totalEntries: 5,
        },
        {
            name: 'Lotto 2389',
            isOpen: true,
            digits: 12,
            grandPrize: '50 ETH',
            ticketPrice: '0.25 ETH',
            totalEntries: 0,
        },
        {
            name: 'Lotto 0995',
            isOpen: true,
            digits: 9,
            grandPrize: '25 ETH',
            ticketPrice: '0.15 ETH',
            totalEntries: 0,
        },
        
    ]);

    const [yourLotteries, setYourLotteries] = useState([
        {
            name: 'Lotto 1095',
            isOpen: true,
            digits: 6,
            grandPrize: '15 ETH',
            ticketPrice: '0.015 ETH',
            totalEntries: 15,
        },
        {
            name: 'Lotto 8883',
            isOpen: false,
            digits: 7,
            grandPrize: '15 ETH',
            ticketPrice: '0.030 ETH',
            totalEntries: 5,
        },
        {
            name: 'Lotto 1313',
            isOpen: true,
            digits: 7,
            grandPrize: '10 ETH',
            ticketPrice: '0.02 ETH',
            totalEntries: 5,
        },
        {
          name: 'Lotto 4981',
          isOpen: true,
          digits: 6,
          grandPrize: '5 ETH',
          ticketPrice: '0.005 ETH',
          totalEntries: 20,
        },
        {
          name: 'Lotto 1181',
          isOpen: false,
          digits: 9,
          grandPrize: '45 ETH',
          ticketPrice: '0.09 ETH',
          totalEntries: 10,
        },
    ]);

    const [archivedLotteries, setArchivedLotteries] = useState([
        {
          name: 'Lotto 1000',
          isOpen: false,
          digits: 12,
          grandPrize: '100 ETH',
          ticketPrice: '0.5 ETH',
          totalEntries: 30,      
        }
    ]); // Define archivedLotteries state
        

    const handleToggleForm = (index) => {
        if (selectedLotteryIndex === index) {
          setSelectedLotteryIndex(null); // Close form if already open
        } else {
          setSelectedLotteryIndex(index); // Open form for the selected index
        }
      };
        
    const handleBuyTickets = (lotteryIndex) => {
        // Implement functionality to buy tickets for a specific lottery
        setShowForm(true);
        console.log('Buying tickets for lottery:', lotteryIndex);
    };

    const handleSendToArchive = (lotteryIndex) => {
      console.log('Sending to Archive:', lotteryIndex);
      const lotteryToArchive = activeLotteries[lotteryIndex];
      setActiveLotteries((prevLotteries) => prevLotteries.filter((_, index) => index !== lotteryIndex));
      setArchivedLotteries((prevLotteries) => [...prevLotteries, lotteryToArchive]);};
    const handleSeeDetais = (lotteryIndex) => {
        console.log('Pulling Details From Chain:', lotteryIndex);};
    return (
        <div className="marketplace">
            <section>
                <h2>Active Lotteries</h2>
                <div className="lottery-container">
                    {activeLotteries.map((lottery, index) => (
                        <LotteryCard
                            key={index}
                            lottery={lottery}
                            onBuyTickets={() => handleBuyTickets(index)}
                            onSendToArchive={() => handleSendToArchive(index)}
                            onSeeDetails={() => handleSeeDetais(index)}
                            showForm={selectedLotteryIndex === index}
                             onToggleForm={() => handleToggleForm(index)}
                        />
                    ))}
                </div>
            </section>
            <section>
                <h2>Your Lotteries</h2>
                <div className="lottery-container">
                    {yourLotteries.map((lottery, index) => (
                        <LotteryCard
                            key={index}
                            lottery={lottery}
                            onBuyTickets={() => handleBuyTickets(index)}
                        />
                    ))}
                </div>
            </section>
            <section>
                <h2>Archive</h2>
                <div className="lottery-container">
                    {archivedLotteries.map((lottery, index) => (
                        <LotteryCard
                            key={index}
                            lottery={lottery}
                            onSeeDetails={() => handleSeeDetais(index)}
                        />
                    ))}
                </div>
            </section>
            {showForm && (
                <NewGuessForm onSubmit={(formData) => {
                    console.log(formData);
                    setShowForm(false); // Close form after submission
                }} />
            )}
        
        </div>
    );
};

export default Marketplace;
