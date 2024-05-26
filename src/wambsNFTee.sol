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
