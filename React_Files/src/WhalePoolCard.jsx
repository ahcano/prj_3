import React from 'react';

const WhalePoolCard = ({ lottery, onSeeDetails, isOpen }) => {
  const { name, grandPrize, ticketPrice, soldtickets, whalecut} = lottery;

  // Determine the class based on whether the lottery is open or closed
  const cardClass = isOpen ? 'whale-pool-card active' : 'whale-pool-card closed';

  return (
    <div className={cardClass}>
      <h3>{name}</h3>
      <p>Pool Amount: {grandPrize}</p>
      <p>Stake: {whalecut}</p>
      <p>Ticket Price: {ticketPrice}</p>
      <p>Tickets Sold: {soldtickets}</p>
      <button onClick={onSeeDetails}>See Details</button>
    </div>
  );
};

export default WhalePoolCard;

