// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleWallet {
    // Step 2a: who owns the wallet
    address public owner;

    // Step 7a: events are declared at contract level, outside any function
    event Deposited(address from, uint256 amount);
    event Withdrawn(address to, uint256 amount);

    // Step 2b: runs once at deployment, so the deployer becomes the owner
    constructor() {
        owner = msg.sender;
    }

    // Step 5: owner-only rule, written once and attached by name
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can do this");
        _;
    }

    // Step 3: anyone can send ETH here
    function deposit() public payable {
        require(msg.value > 0, "Send some ETH");
        emit Deposited(msg.sender, msg.value);   // Step 7b
    }

    // Step 4: read how much ETH the contract holds
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    // Step 6: only the owner can take the ETH out
    function withdraw() public onlyOwner {
        uint256 amount = address(this).balance;
        (bool sent, ) = payable(owner).call{value: amount}("");
        require(sent, "Withdraw failed");
        emit Withdrawn(owner, amount);           // Step 7c
    }
}