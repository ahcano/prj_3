// App.js
import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import './App.css';
import Marketplace from './Marketplace';
import Header from './Header';
import Dashboard from './Dashboard';
import WhaleDash from './Whale';
import Lotteries from './LotteryGen';

function App() {
  return (
    <Router>
      <div className="App">
        <Header />
        <Routes>
          <Route exact path="/lotteries" element={<Marketplace />} />
          <Route exact path="/dashboard" element={<Dashboard />} />
          <Route exact path="/whale" element={<WhaleDash />} />
          <Route exact path="/whale/newlottery" element={<Lotteries />} />
        </Routes>
      </div>
    </Router>
  );
}

export default App;





