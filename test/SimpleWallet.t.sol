// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {SimpleWallet} from "../src/SimpleWallet.sol";

contract SimpleWalletTest is Test {
    SimpleWallet wallet;

    function setUp() public {
        wallet = new SimpleWallet();
    }

    function test_OwnerIsDeployer() public {
        assertEq(wallet.owner(), address(this));
    }
}