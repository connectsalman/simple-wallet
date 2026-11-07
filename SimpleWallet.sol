// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleWallet {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function deposit() public payable {
       require(msg.value > 0, "Send some Eth"); 
    }

    function getBalance() public view onlyOwner returns (uint256) {
        return 
        address(this).balance;
    }
    modifier onlyOwner() {
    require(msg.sender == owner, "Only the owner can do this");
    _;
}
}