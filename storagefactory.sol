//SPDX-License-Identifier: MIT
pragma solidity 0.8.18;
import {SimpleStorageMain} from "./simplestorage.sol";

contract StorageFactory {
    SimpleStorageMain[] public listSimpleStorageContracts;
    //address[] public listSimpleStorageContracts;
    
    function createSimpleStorageContract() public {
        SimpleStorageMain newsimplestoragecontract = new SimpleStorageMain();
        listSimpleStorageContracts.push(newsimplestoragecontract);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {
        //SimpleStorageMain mySimpleStorage = SimpleStorageMain(listSimpleStorageContracts[_simpleStorageIndex]);
        SimpleStorageMain mySimpleStorage = listSimpleStorageContracts[_simpleStorageIndex];
        mySimpleStorage.store(_newSimpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        SimpleStorageMain mySimpleStorage = listSimpleStorageContracts[_simpleStorageIndex];
        return mySimpleStorage.retrieve();
    }
}