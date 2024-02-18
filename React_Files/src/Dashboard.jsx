import React from 'react';
import UserSettings from './assets/UserSettings';
import WalletSettings from './assets/WalletSettings';
import Notifications from './assets/Notifications';

const Dashboard = () => {
  return (
    <div className="dashboard-container"> 
      <h1 className="dashboard-heading">Welcome Back</h1>

      {/* User Preferences Section */}
      <div className="user-preferences">
        {/* UserSettings Widget */}
        <div className="widget-container">
          <div className="widget">
            <UserSettings />
          </div>
          <div className="widget-label">User Settings</div>
        </div>

        {/* Wallet Widget */}
        <div className="widget-container">
          <div className="widget">
            <WalletSettings />
          </div>
          <div className="widget-label">Wallet Settings</div>
        </div>

        {/* Notifications Widget */}
        <div className="widget-container">
          <div className="widget">
            <Notifications />
          </div>
          <div className="widget-label">Notifications</div>
        </div>
      </div>
    </div>
  );
};

export default Dashboard;





