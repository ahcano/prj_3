import React, { useState } from 'react';

const NewGuessForm = ({ onSubmit }) => {
  const [Guess, setGuess] = useState('');

  const handleSubmit = (e) => {
    e.preventDefault();
    // Form validation logic can be added here
    onSubmit({Guess});
    // Reset form fields after submission
    setStake('');
  };

  return (
    <form onSubmit={handleSubmit}>
      <label>
        Guess (2-digit Numbers Only):
        <input type="text" value={Guess} onChange={(e) => setGuess(e.target.value)} />
      </label>
      <button type="submit">Submit Guess</button>
    </form>
  );
};

export default NewGuessForm;