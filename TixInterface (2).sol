// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ITIX {
    function mint(address to, uint amount) external returns (address, address payable);
    function batchMint(address []  memory to, uint amount) external;
}