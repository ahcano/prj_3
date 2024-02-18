// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ILottery {
    function initialJackpot() external view returns (uint);
    function treasurycut() external view returns (uint);
    function ticketprice() external view returns (uint);
    function lotterycap() external view returns (uint);
    function whalepct_before() external view returns (uint);
    function whalepct_half() external view returns (uint);
    function whalepct_after() external view returns (uint);
    function lottDigitAmount() external view returns (uint);
    function WhaleKey() external view returns (address);
    function ContractKey() external view returns (address);
}

