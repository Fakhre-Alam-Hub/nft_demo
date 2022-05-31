// SPDX-License-Identifier: MIT
pragma solidity ^0.6.6;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract SimpleCollectible is ERC721 {
    uint256 public tokenCounter;
    constructor () public ERC721 ("Dogie", "DOG"){
        tokenCounter = 0;
    }

    function createCollectible(string memory tokenURI) public returns (uint256) {
        // creating a new NFT is just mapping a tokenid to new address
        uint256 newItemId = tokenCounter;

        // _safeMint funtion is used to create new nft with unique tokenid
        _safeMint(msg.sender, newItemId);

        // tokenURI is a distinct Uniform Resource Identifier (URI) for a given asset
        _setTokenURI(newItemId, tokenURI);
        tokenCounter = tokenCounter + 1;
        return newItemId;
    }

}