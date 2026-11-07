# Simple Wallet

A small Solidity smart contract that lets anyone deposit ETH and lets only the owner withdraw it.

## What it does
- Anyone can deposit ETH
- Anyone can check the wallet's balance
- Only the owner can withdraw the ETH

## How it works
The deployer becomes the owner in the constructor. The onlyOwner modifier protects withdraw. Events announce deposits and withdrawals.

## Functions
- deposit(): receives ETH, rejects empty deposits
- getBalance(): returns the ETH held, in wei
- withdraw(): owner-only, sends the whole balance to the owner

## What I learned
payable, msg.sender, msg.value, modifiers, require and events.

## Limitations
- Practice project with no automated tests yet
- The owner cannot be changed
- Withdraw sends the whole balance
- Not audited, so do not use it with real money

## Run the tests
Install Foundry, then run: forge test
