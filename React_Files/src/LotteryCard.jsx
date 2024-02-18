import React from 'react';

const LotteryCard = ({ lottery, onToggleForm, onSendToArchive, onSeeDetails, isInArchive }) => {
  const { name, isOpen, grandPrize, ticketPrice, totalEntries, digits } = lottery;

  return (
    <div className={`lottery-card ${isOpen ? 'active' : 'closed'}`}>
      <h3>{name}</h3>
      <p>Guess Length: {digits}</p>
      <p>Grand Prize: {grandPrize}</p>
      <p>Ticket Price: {ticketPrice}</p>
      <p>Your Entries: {totalEntries}</p>
      
      {isOpen && !isInArchive ? (
        <button onClick={onToggleForm}>Buy Ticket</button>
      ) : (
        <>
          {isInArchive ? (
            <button onClick={onSeeDetails}>See Details</button>
          ) : (
            <button onClick={onSendToArchive}>Send to Archive</button>
          )}
        </>
      )}
    </div>
  );
};

export default LotteryCard;



