// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract Fundme{
    //uint256 public myval = 1;
    uint256 public minusd = 5;

    function fund() public payable {

        //myval = myval + 2;
        require(msg.value >= minusd,"Didn't send enough ETH!"); 
    }

    function getPrice() public view returns (uint256){
        //Address 0x5147eA642CAEF7BD9c1265AadcA78f997AbB9649
        //ABI
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43);
        (, int256 price,,,) = priceFeed.latestRoundData();
        return uint256(price) * 1e10;
    }

    function getVersion() public view returns (uint256){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }
}