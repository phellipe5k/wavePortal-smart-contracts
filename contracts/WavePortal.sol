// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalColors;
    struct userInfo {
        string name;
        string email;
        string favorite_color;
    }
    mapping(uint256 => userInfo) users;
    uint256[] public userIds;
    constructor() {
        console.log("Hello, World! I am a contract");
    }
/*
    function wave() public {
        totalWaves += 1;
        console.log("Waved!", msg.sender);
    }
*/
    function getColorsMetrics() public view returns(uint256) {
        console.log("We have total waves!", totalColors);
        return totalColors;
    }

    function registerUser(string memory name, string memory email, string memory favorite_color, uint256 id) public {
        userInfo storage newUser = users[id];
        newUser.name = name;
        newUser.email = email;
        newUser.favorite_color = favorite_color;
        userIds.push(id);
        totalColors++;
    }

    function getUsers() public view returns (uint256) {
        uint i = 0;
        for (i; i < userIds.length; i++) {
        console.log(users[i].name, "favorite color is ", users[i].favorite_color);
        console.log("Email: ", users[i].email);
        }
        return userIds[i];
    }
}