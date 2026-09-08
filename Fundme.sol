// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import {PriceConvertor} from "./PriceConvertor.sol";

error NotOwner();

contract Fundme{
    //uint256 public myval = 1;
    using PriceConvertor for uint256;
    uint256 public constant minusd = 5 * (10**18);

    address[] public funders;
    mapping (address funder => uint256 amountFunded) public addressToAmountFunded;
    address public immutable owner;
    constructor(){
        owner = msg.sender;
    }

    function fund() public payable {

        //myval = myval + 2;
        require(msg.value.getConversionRate() >= minusd,"Didn't send enough ETH!");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] +=  msg.value;
    }

    function withDraw() public onlyOwner{
        for(uint256 funderIndex = 0; funderIndex <= funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        funders = new address[](0);

        //using transfer caped at 2300 gas if crossed throws an error
        //msg.sender = address
        //payable(msg.sender) = payable address
        payable(msg.sender).transfer(address(this).balance);

        //send method also capped at 2300 gas and returns a boolean
        bool sendSuccess = payable(msg.sender).send(address(this).balance);
        require(sendSuccess,"Send Failed!"); // if sendsuccess id ture nothing if false then send failed and revert the transaction

        //using call
        (bool callSuccess, /*bytes memory dataReturned*/) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess,"Call Failed!");
    }

    modifier onlyOwner(){
        //require(msg.sender == owner,"Must be owner!");
        if (msg.sender != owner){
            revert NotOwner();
        }

        _;
    }
    
}