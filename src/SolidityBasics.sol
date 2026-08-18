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

    modifier onlyOwner() {
        require(msg.sender == owner , "Not Owner");

        _;
    }

    function setOwner(address newOwner) public onlyOwner(){
        require(newOwner != address(0), "Invalid owner!");
        owner = newOwner;
    }

    function whoAmI() public view returns(address){
        return msg.sender;
    }

    event Deposited(address sender, uint256 amount);

    event Withdrawn(address user, uint256 amount);

    function deposit() public payable {
        balances[msg.sender]+=msg.value;
        emit Deposited(msg.sender, msg.value);
    }

    function withdraw(uint256 amount) public{
        require(balances[msg.sender] >= amount, "Not enough balance");
        balances[msg.sender]-= amount;
        (bool success, ) = payable(msg.sender).call{value: amount}("");
        require(success, "Transfer failed");

        emit Withdrawn(msg.sender, amount);
    }

    function getMyBalance() public view returns(uint256){
        return balances[msg.sender];
    }

    function getContractBalance() public view returns(uint256){
        return address(this).balance;
    }
}