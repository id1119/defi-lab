// SPDX-License-Identifier: MIT
pragma solidity ^0.8.35;

contract SolidityBasics{

    uint256 private number;
    address private owner;
    mapping (address => uint256) balances;

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function getNumber() public view returns(uint256){
        return number;
    }

    constructor() {
        owner = msg.sender;
    }

    function getOwner() public view returns(address){
        return owner;
    }

    function setOwner(address newOwner) public {
        owner = newOwner;
    }

    function whoAmI() public view returns(address){
        return msg.sender;
    }

    function deposit() public payable {
        balances[msg.sender]+=msg.value;

    }

    function getMyBalance() public view returns(uint256){
        return balances[msg.sender];
    }
    
}