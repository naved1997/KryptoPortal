// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract KryptoPortal {
    uint256 totalKryptos;

    event NewKrypto(address indexed from, uint256 timestamp, string message);

    struct Krypto {
        address sender;
        string message;
        uint256 timestamp;
    }

    Krypto[] kryptos;

    constructor() payable {
        console.log("We have been constructed!");
    }

    function krypto(string memory _message) public {
        totalKryptos += 1;
        console.log("%s sent Krypto!", msg.sender);

        kryptos.push(Krypto(msg.sender, _message, block.timestamp));

        emit NewKrypto(msg.sender, block.timestamp, _message);

        uint256 prizeAmount = 0.0001 ether;
        require(
            prizeAmount <= address(this).balance,
            "Trying to withdraw more money than they contract has."
        );
        (bool success, ) = (msg.sender).call{value: prizeAmount}("");
        require(success, "Failed to withdraw money from contract.");
    }

    function getAllKryptos() public view returns (Krypto[] memory) {
        return kryptos;
    }

    function getTotalKryptos() public view returns (uint256) {
        return totalKryptos;
    }
}