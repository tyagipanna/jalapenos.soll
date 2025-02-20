// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AIGeneratedArtNFT {
    struct NFT {
        uint256 id;
        string metadata;
    }
    
    mapping(uint256 => NFT) public nfts;
    mapping(uint256 => address) public ownerOf;
    uint256 public nextId = 1;
    
    event Minted(uint256 id, address owner, string metadata);
    
    function mint(string memory metadata) public {
        uint256 id = nextId;
        nfts[id] = NFT(id, metadata);
        ownerOf[id] = msg.sender;
        nextId++;
        emit Minted(id, msg.sender, metadata);
    }
    
    function updateMetadata(uint256 id, string memory newMetadata) public {
        require(ownerOf[id] == msg.sender, "Not the owner");
        nfts[id].metadata = newMetadata;
    }
    
    function getNFT(uint256 id) public view returns (uint256, string memory, address) {
        return (nfts[id].id, nfts[id].metadata, ownerOf[id]);
    }
}
