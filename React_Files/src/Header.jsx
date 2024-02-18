// Header.jsx
import React from 'react';
import { Link } from 'react-router-dom';

const Header = () => {
  return (
    <header>
      <nav>
        <ul className="menu">
          <img src="Lottix_Logo.png" alt="Logo" />
          <li><Link to="/dashboard">Dashboard</Link></li>
          <li><Link to="/lotteries" className="active">Play Lottery</Link></li>
          <li><Link to="/whale">Create a Lottery</Link></li>
          <li className="dropdown">
            <Link to="/settings">Settings</Link>
            <div className="dropdown-content">
              <Link to="/user-settings">User Settings</Link>
              <Link to="/wallet-settings">Wallet Settings</Link>
            </div>
          </li>
          <li className="dropdown">
            <Link to="/about">About Lottix</Link>
            <div className="dropdown-content">
              <Link to="/whitepaper">Lottix Whitepaper</Link>
              <Link to="/team">Lottix Team</Link>
              <Link to="/privacy">Privacy Policy</Link>
              <Link to="/api">LottixAPI</Link>
            </div>
          </li>
          <li className="dropdown">
            <Link to="/contact">Contact Lottix</Link>
            <div className="dropdown-content">
              <Link to="/email">Email</Link>
              <Link to="/discord">Discord</Link>
              <Link to="/suggestion-box">Suggestion Box</Link>
            </div>
          </li>
          <li><Link to="/notifications">Notifications</Link></li>
        </ul>
      </nav>
    </header>
  );
};

export default Header;


