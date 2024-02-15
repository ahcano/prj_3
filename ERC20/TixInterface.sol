// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ITIX {
    function mint(address, uint) external returns (address, address payable);

}