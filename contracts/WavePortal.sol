// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract WavePortal {
    string[] public colors;
    constructor() {
        console.log("Hello, World! I am a contract");
    }
    function getColors() public view returns(string[] memory) {
        return colors;
    }


    function getTotalColors() public view returns(uint256) {
        return colors.length;
    }
    

    function registerColor(string memory color) public {
        colors.push(color);
    }

}