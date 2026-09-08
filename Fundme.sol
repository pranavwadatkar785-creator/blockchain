// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import {PriceConvertor} from "./PriceConvertor.sol";

contract Fundme{
    //uint256 public myval = 1;
    using PriceConvertor for uint256;
    uint256 public minusd = 5 * (10**18);

    address[] public funders;
    mapping (address funder => uint256 amountFunded) public addressToAmountFunded;

    function fund() public payable {

        //myval = myval + 2;
        require(msg.value.getConversionRate() >= minusd,"Didn't send enough ETH!");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;

    }
}