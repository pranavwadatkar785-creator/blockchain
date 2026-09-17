// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;
import {Script} from "forge-std/Script.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";

contract DeploySS is Script {
    function run() external returns (SimpleStorage){
        uint256 startingvalue = 1;
        
        vm.startBroadcast();
        SimpleStorage simpleStorage = new SimpleStorage();
        vm.stopBroadcast();
        return simpleStorage;
    }
}