// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract WavePortal {
    event NewVote(address indexed from, uint256 timestamp, string color);
    
    uint256 private seed;

    struct ColorVote {
        address user;
        string color;
        uint256 timestamp;
    }
    ColorVote[] colors;
    /*
     * This is an address => uint mapping, meaning I can associate an address with a number!
     * In this case, I'll be storing the address with the last time the user waved at us.
     */
    mapping(address => uint256) public lastWavedAt;

    constructor() payable {
        console.log("Hello, World! I am a contract");
        seed = (block.timestamp + block.difficulty) % 100;
    }

    function getColors() public view returns(ColorVote[] memory) {
        return colors;
    }


    function getTotalColors() public view returns(uint256) {
        return colors.length;
    }
    

    function registerColor(string memory color) public {
        
        /*
            make sure if the waver have at least 15 minutes since his last vote
         */
         require(
             lastWavedAt[msg.sender] + 15 minutes < block.timestamp,
             "Must wait 15 minutes before voting again"
         );

         /* if he passed, create a new timestamp for him */
         
        lastWavedAt[msg.sender] = block.timestamp;
        
        colors.push(ColorVote(msg.sender, color, block.timestamp));

        seed = (block.difficulty + block.timestamp + seed) % 100;

        console.log("random number generated", seed);

        if (seed <= 25) {
            uint256 prizeAmount = 0.0001 ether;
            require(prizeAmount <= address(this).balance, "Trying to withdraw more money than the contract has");
            (bool success, ) = (msg.sender).call{ value: prizeAmount }("");
            require(success, "Failed to withdraw money from contract");
        }
        
        emit NewVote(msg.sender, block.timestamp, color);
        
    }

}