// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiscoveryToken {
    // Mapping to keep track of token balances of each address
    mapping(address => uint256) public balances;

    // Total supply of tokens (can be modified based on your needs)
    uint256 public totalSupply = 10000;

    // Event to log when tokens are issued
    event TokensIssued(address indexed user, uint256 amount);

    // Function to issue tokens to the sender (e.g., when a new location is discovered)
    function issueTokens(uint256 amount) public {
        require(amount > 0, "Amount must be greater than zero.");
        require(totalSupply >= amount, "Not enough tokens available.");

        balances[msg.sender] += amount;  // Issue tokens to the sender
        totalSupply -= amount;  // Reduce total supply
        emit TokensIssued(msg.sender, amount);  // Emit event
    }

    // Function to view the balance of the sender
    function viewBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}
