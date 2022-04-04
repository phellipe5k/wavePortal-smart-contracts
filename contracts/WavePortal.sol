// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalColors;

    constructor() {
        console.log("Hello, World! I am a contract");
    }
    function getColorsMetrics() public view returns(uint256) {
        console.log("We have total waves!", totalColors);
        return totalColors;
    }

    function registerColor() public {
        totalColors += 1;
    }

}