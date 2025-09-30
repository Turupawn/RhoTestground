// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {IERC20} from "forge-std/interfaces/IERC20.sol";

contract TokenBalanceScript is Script {
    // Token and user addresses
    address public constant TOKEN_ADDRESS = 0x639355f34Ca9935E0004e30bD77b9cE2ADA0E692;
    address public constant USER_ADDRESS = 0x271f70Ed8B8154010d06CE809D78f8A2665eFed9;

    function run() public {
        uint256 forkId = vm.createFork("https://rpc.scroll.io");
        vm.selectFork(forkId);
        
        IERC20 token = IERC20(TOKEN_ADDRESS);
        uint256 balance = token.balanceOf(USER_ADDRESS);
        
        console.log("=== Token Balance ===");
        console.log("Token Address:", TOKEN_ADDRESS);
        console.log("User Address:", USER_ADDRESS);
        console.log("Balance:", balance);
        console.log("Balance (formatted):", balance / 1e18, "tokens");
    }
}
