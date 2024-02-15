import React, { useState } from 'react';
import WhalePoolCard from './WhalePoolCard';
import PlusIcon from './assets/PlusIcon';
import NewLotteryForm from './NewLotteryForm';
import { useNavigate } from 'react-router-dom';


const WhaleDash = () => {
  const navigate = useNavigate();
  const [isHovered, setIsHovered] = useState(false);
  

  // Handle action for seeing details
  const handleSeeDetails = (index) => {
    console.log('Pulling Details From Database:', index);
    // Implement functionality to fetch details of the selected whale
  };

  const handleGenerateNewLottery = () => {
    navigate('/whale/newlottery'); // Navigate to the new lottery page
  };
  const activeLotteries = [
    {
      name: 'Lotto 1313',
      isOpen: true,
      grandPrize: '10 ETH',
      ticketPrice: '0.015 ETH',
      soldtickets: 13202,
      whalecut: '35%',
    },
    {
      name: 'Lotto 2389',
      isOpen: true,
      grandPrize: '2 ETH',
      ticketPrice: '0.0025 ETH',
      soldtickets: 9055,
      whalecut: '70%',
    },
    {
      name: 'Lotto 0995',
      isOpen: true,
      grandPrize: '0.5 ETH',
      ticketPrice: '0.0006 ETH',
      soldtickets: 1487,
      whalecut: '70%',
    },
    {
      name: 'Lotto 0215',
      isOpen: true,
      grandPrize: '0.5 ETH',
      ticketPrice: '0.0006 ETH',
      soldtickets: 1083,
      whalecut: '70%',
    },
  ];

  const inactiveLotteries = [
    {
      name: 'Lotto 2151',
      isOpen: false,
      grandPrize: '0.3 ETH',
      ticketPrice: '0.0003 ETH',
      soldtickets: 150,
      whalecut: '50%',
    },
    {
      name: 'Lotto 8937',
      isOpen: false,
      grandPrize: '1 ETH',
      ticketPrice: '0.001 ETH',
      soldtickets: 300,
      whalecut: '70%',
    },
    {
      name: 'Lotto 7764',
      isOpen: false,
      grandPrize: '0.8 ETH',
      ticketPrice: '0.0015 ETH',
      soldtickets: 250,
      whalecut: '70%',
    },
  ];
  const archivedLotteries = [
    {
      name: 'Lotto 2151',
      isOpen: false,
      grandPrize: '0.3 ETH',
      ticketPrice: '0.0003 ETH',
      soldtickets: 150,
      whalecut: '70%',
    },
    {
      name: 'Lotto 8937',
      isOpen: false,
      grandPrize: '1 ETH',
      ticketPrice: '0.001 ETH',
      soldtickets: 300,
      whalecut: '70%',
    },
    {
      name: 'Lotto 7764',
      isOpen: false,
      grandPrize: '0.8 ETH',
      ticketPrice: '0.0015 ETH',
      soldtickets: 250,
      whalecut: '70%',
    },
  ];

  return (
    <div>
      <div className="whale-widgets" style={{ display: 'flex', flexWrap: 'wrap', justifyContent: 'left', margin: '14px' }}>
        {/* Adjusted Generate New Lottery Widget to align PlusIcon correctly */}
        <div style={{ 
            position: 'relative', // Allows absolute positioning within
            width: '250px', 
            margin: '14px',
            display: 'flex', 
            flexDirection: 'column', 
            alignItems: 'center', 
            justifyContent: 'center', // Align items to start to allow text at top
            textAlign: 'center', 
            padding: '0px',
            boxSizing: 'border-box',
        }}>
          {/* PlusIcon container adjusted for alignment */}
          <div className="plus-icon-container" onMouseEnter={() => setIsHovered(true)} onMouseLeave={() => setIsHovered(false)} onClick={handleGenerateNewLottery} style={{
            marginTop: '0px', // Adjust based on text height to keep PlusIcon centered
            flex: 1, // Allows the PlusIcon to fill the container for center alignment
            display: 'flex',
            alignItems: 'center', // Center PlusIcon vertically
            justifyContent: 'center', // Center PlusIcon horizontally
            width: '100%', // Ensure it fills the container width
          }}>
            <PlusIcon className={isHovered ? "plus-icon hovered" : "plus-icon"} />
          </div>
        </div>

        {/* Mapping through active lotteries */}
        {activeLotteries.map((whale, index) => (
          <div key={index} style={{ width: '250px', margin: '14px' }}>
            <WhalePoolCard
              lottery={whale}
              onSeeDetails={() => handleSeeDetails(index)}
              isOpen={whale.isOpen}
            />
          </div>
        ))}
      </div>
      
      <h3 style={{ marginLeft: '55px' }}>Inactive Lotteries</h3>
      <div className="whale-widgets" style={{ display: 'flex', flexWrap: 'wrap', justifyContent: 'left', marginLeft: '45px' }}>
        {inactiveLotteries.map((whale, index) => (
          <div key={index} style={{ width: '250px', margin: '14px' }}>
            <WhalePoolCard
              lottery={whale}
              onSeeDetails={() => handleSeeDetails(index)}
              isOpen={whale.isOpen}
            />
          </div>
        ))}
      </div>
      
      <h3 style={{ marginLeft: '55px' }}>Archive</h3>
      <div className="whale-widgets" style={{ display: 'flex', flexWrap: 'wrap', justifyContent: 'left', marginLeft: '45px' }}>
        {archivedLotteries.map((whale, index) => (
          <div key={index} style={{ width: '250px', margin: '14px' }}>
            <WhalePoolCard
              lottery={whale}
              onSeeDetails={() => handleSeeDetails(index)}
              isOpen={whale.isOpen}
            />
          </div>
        ))}
      </div>
    </div>
  );
};

export default WhaleDash;
