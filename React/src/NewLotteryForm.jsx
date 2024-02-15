import React, { useState } from 'react';

const NewLotteryForm = ({ onSubmit }) => {
  const [stake, setStake] = useState('');

  const handleSubmit = (e) => {
    e.preventDefault();
    // Form validation logic can be added here
    onSubmit({stake});
    // Reset form fields after submission
    setStake('');
  };

  return (
    <form onSubmit={handleSubmit}>
      <label>
        Investment Amount:
        <input type="text" value={stake} onChange={(e) => setStake(e.target.value)} />
      </label>
      <button type="submit">Generate Lottery</button>
    </form>
  );
};

export default NewLotteryForm;
