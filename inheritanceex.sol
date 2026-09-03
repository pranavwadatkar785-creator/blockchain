//SPDX-License-Identifier: MIT
pragma solidity 0.8.18;
import {SimpleStorageMain} from "./simplestorage.sol";

contract changefavnum is SimpleStorageMain{

    function store(uint256 _favnum) public override {
        myfavnum  = 5 + _favnum;
    }
}