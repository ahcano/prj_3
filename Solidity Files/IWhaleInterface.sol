// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


interface IWhale {
    function setFactoryDetails() external returns (address, address payable);
    function generateLottery(uint ticketprice, address ContractKey, uint lottDigitAmount, address tixTokenAddress) external returns (address payable);
}