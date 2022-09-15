// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "hardhat/console.sol";

contract Counter {
    uint256 public count;

    // Function to get the current count
    function get() public view returns (uint256) {
        return count;
    }

    // Function to increment count by 1
    function inc() public {
        console.log(
            "Increase from %s to %s by %s",
            count,
            count + 1,
            msg.sender
        );
        count += 1;
    }

    // Function to decrement count by 1
    function dec() public {
        // This function will fail if count = 0
        console.log(
            "Decrease from %s to %s by %s",
            count,
            count - 1,
            msg.sender
        );
        count -= 1;
    }
}
