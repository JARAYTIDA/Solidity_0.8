//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract RentBike{

    address payable public owner;

    constructor () {
        owner = payable(msg.sender);
    }

    // add yourself as a renter
    struct Renter{
        address payable walletAddress;
        string name;
        bool canRent;
        bool active;
        uint balance;
        uint due;
        uint start;
        uint end;
    }

    struct forRent{
        address payable walletAddress;
        string name;
        bool canGiveForRent;
        uint amountToBeCollected;
    }

    receive () external payable {}

    mapping (address => Renter) public renters;
    forRent[] public personalBikes;
    mapping (address => forRent) public personalRents;
    mapping (address => forRent) public lessors;

    function addRenter( address payable walletAddress, string memory name, bool canRent, bool active, uint balance, uint due, uint start, uint end) public {
        renters[walletAddress] = Renter(walletAddress, name, canRent, active, balance, due, start, end);
    }

    function addForRent( address payable walletAddress, string memory name, bool canGiveForRent, uint amountToBeCollected) public {
        personalBikes.push(forRent(walletAddress, name, canGiveForRent, amountToBeCollected));
        lessors[walletAddress] = forRent(walletAddress, name, canGiveForRent, amountToBeCollected);
    }

    // deposit a amount
    function depositAmount() payable public {
        renters[msg.sender].balance += msg.value;
    }

    // check-out bike
    function checkOut(address payable walletAddr) public {
        // Renter memory tmp = renters[walletAddr];
        require(renters[walletAddr].balance > 0 , "insufficient balance");
        require(renters[walletAddr].due == 0, "dues are pending");
        require(renters[walletAddr].active == false, "already on a bike");
        renters[walletAddr].active = true;
        renters[walletAddr].start = block.timestamp;
        renters[walletAddr].canRent = false;
    }

    // check-in a bike
    function checkIn(address payable walletAddr) public  {
        require(renters[walletAddr].active == true, "not checked out any bike");
        // Renter memory tmp = renters[walletAddr];
        renters[walletAddr].active = false;
        // renters[walletAddr].canRent = true;  //haven't confirmed no-dues status
        renters[walletAddr].end = block.timestamp;
        setDueAmount(walletAddr);
        // renters[walletAddr].due = renters[walletAddr].end - renters[walletAddr].start;
    }

    // get total duration of bike use
    function totalDuration(address payable walletAddr) public view returns(uint){
        // Renter memory tmp = renters[walletAddr];
        uint timeSpanInMin = (renters[walletAddr].end - renters[walletAddr].start);
        return timeSpanInMin;
    }

    // get contract balance
    function getBalenceOfConract() external view returns(uint){
        return address(this).balance;
    }

    // get renter's balance
    function getRenterBal(address payable walletAddr) external view returns(uint){
        return renters[walletAddr].balance;
    }

    // set Due amount
    function setDueAmount(address payable walletAddr) internal{
        renters[walletAddr].due = (5000000000000000*(totalDuration(walletAddr)/5));
    }

    function canRentBike(address payable walletAddr) external view returns(bool){
        return renters[walletAddr].canRent;
    }

    function payDues(address payable walletAddr) public {
        uint _amount = renters[walletAddr].due;
        require(renters[walletAddr].balance >= _amount, "your balance is low");
        renters[walletAddr].balance -= _amount;
        renters[walletAddr].canRent = true;
        renters[walletAddr].due = 0;
        renters[walletAddr].start = 0;
        renters[walletAddr].end = 0;
    }

    function collectAmountLessor(address payable walletAddr) public{
        (lessors[walletAddr].walletAddress).transfer(lessors[walletAddr].amountToBeCollected);
        lessors[walletAddr].canGiveForRent = true;
        lessors[walletAddr].amountToBeCollected = 0;
    }

    function checkOutPersonal(address payable walletAddr) public {
        require(personalBikes.length > 0, "there are no personal bikes available");
        require(renters[walletAddr].balance > 0 , "insufficient balance");
        require(renters[walletAddr].due == 0, "dues are pending");
        require(renters[walletAddr].active == false, "already on a bike");
        uint len = personalBikes.length;
        forRent memory Bike = personalBikes[len-1];
        personalRents[walletAddr] = Bike;
        personalBikes.pop();
        renters[walletAddr].active = true;
        renters[walletAddr].start = block.timestamp;
        renters[walletAddr].canRent = false;
    } 

    function personalPay(address payable walletAddr, uint _amount ) public payable{
        (bool val, ) = walletAddr.call{value : _amount}("");
        require(val == true, "taransaction failed");
    }

    function checkInPersonal(address payable walletAddr) public{
        require(renters[walletAddr].active == true, "not checked out any bike");
        renters[walletAddr].active = false;
        renters[walletAddr].end = block.timestamp;
        renters[walletAddr].due = 5000000000000000*(renters[walletAddr].end - renters[walletAddr].start);
        personalBikes.push(personalRents[walletAddr]);
        lessors[personalRents[walletAddr].walletAddress].amountToBeCollected = renters[walletAddr].due;
        require(renters[walletAddr].due <= renters[walletAddr].balance, "insufficient balance ! you can't check-in");
        personalPay(personalRents[walletAddr].walletAddress, renters[walletAddr].due);
        delete personalRents[walletAddr];
    }
}