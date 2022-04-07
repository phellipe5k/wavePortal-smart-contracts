// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract WavePortal {
    event NewVote(address indexed from, uint256 timestamp, string color);
    
    struct ColorVote {
        address user;
        string color;
        uint256 timestamp;
    }
    ColorVote[] colors;

    
    constructor() {
        console.log("Hello, World! I am a contract");
    }
    function getColors() public view returns(ColorVote[] memory) {
        return colors;
    }


    function getTotalColors() public view returns(uint256) {
        return colors.length;
    }
    

    function registerColor(string memory color) public {
        colors.push(ColorVote(msg.sender, color, block.timestamp));

        emit NewVote(msg.sender, block.timestamp, color);
    }

}