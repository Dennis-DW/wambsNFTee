# wambsNFTee Deployment Guide

This guide will walk you through the process i deployed the `wambsNFTee` NFT contract using Foundry, an Ethereum development environment and framework. 

## Prerequisites

- Foundry installed on your local machine. You can follow the [Foundry installation guide](https://book.getfoundry.sh/getting-started/installation.html).
- A QuickNode RPC URL.
- Your Ethereum private key.

## Step-by-Step Instructions

### 1. Contract Code

Create a file named `wambsNFTee.sol` inside a directory named `src` and paste the following contract code into it:

```solidity
// SPDX-Licence-Identifier: MIT
pragma solidity ^0.8.13;

// Import the ERC721 interface from OpenZeppelin
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

// Define the NFT contract
contract wambsNFTee is ERC721 {
    //  Define the constructor
    constructor() ERC721("wambsNFTee", "WAMBS") {
        // Mint an NFT to the contract creator
        _mint(msg.sender, 1);
    }
}
```

### 2. Install OpenZeppelin Contracts

Navigate to your project directory and run the following command to fetch OpenZeppelin's contracts repository from GitHub:

```sh
forge install OpenZeppelin/openzeppelin-contracts
```

### 3. Update Remappings

Run the following command to generate a `remappings.txt` file that acts as a configuration file for all your remappings:

```sh
forge remappings > remappings.txt
```

### 4. Compile the Contract

Delete the `test` folder (if it exists) and run the following command to compile your contract:

```sh
forge build
```

### 5. Set Up Deployment Configuration

Create a `.env` file in your project root directory and add the following variables:

```sh
ALCHEMY_RPC_URL=<Your ALCHEMY RPC URL>
PRIVATE_KEY=<Your Ethereum private key>
```

Make sure to replace `<Your ALCHEMY RPC URL>` and `<Your Ethereum private key>` with your actual ALCHEMY RPC URL and private key respectively.

### 6. Deploy the Contract

Run the following command to deploy your contract to the Sepolia Test Network:

```sh
source .env
forge create --rpc-url $ALCHEMY_RPC_URL --private-key $PRIVATE_KEY src/wambsNFTee.sol:wambsNFTee
```

This command will compile your contract and deploy it. Once deployed, it will output the contract address.

### 7. Verify Deployment

Copy the contract address from the output and look it up on [Sepolia Etherscan](https://sepolia.etherscan.io/). Open the first transaction there to verify that an NFT was minted and transferred to your address.


### Additional Resources

- [Foundry Documentation](https://book.getfoundry.sh/)
- [OpenZeppelin Contracts](https://github.com/OpenZeppelin/openzeppelin-contracts)