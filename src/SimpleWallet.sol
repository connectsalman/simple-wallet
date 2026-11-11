// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleWallet {
    // The wallet owner, set when the contract is deployed
    address public owner;

    // Announcements for deposits and withdrawals
    event Deposited(address from, uint256 amount);
    event Withdrawn(address to, uint256 amount);

    // Runs once at deployment: the deployer becomes the owner
    constructor() {
        owner = msg.sender;
    }

    // Rule: only the owner can run functions that use this
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can do this");
        _;
    }

    // Anyone can send ETH to this wallet
    function deposit() public payable {
        require(msg.value > 0, "Send some ETH");
        emit Deposited(msg.sender, msg.value);
    }

    // Shows how much ETH the wallet holds, in wei
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    // Only the owner can take all the ETH out
    function withdraw() public onlyOwner {
        uint256 amount = address(this).balance;
        (bool sent,) = payable(owner).call{value: amount}("");
        require(sent, "Withdraw failed");
        emit Withdrawn(owner, amount);
    }
}
