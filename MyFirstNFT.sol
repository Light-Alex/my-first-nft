// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// ERC721: NFT 标准基础合约
// ERC721Enumerable: 提供 NFT 枚举功能
// ERC721URIStorage: 提供 NFT URI 存储功能
// Ownable: 权限管理，只有拥有者可以执行某些操作


contract MyFirstNFT is ERC721, ERC721Enumerable, ERC721URIStorage, Ownable{
    
    uint256 private _nextTokenId;

    constructor(address owner)
    ERC721("pitouNFT", "PTN") // NFT全称，简称
    Ownable(owner) // 指定管理员，管理员才有权限铸币
    {
        
    }

    // 颁发NFT给address to
    function safeMint(address to, string memory uri) public onlyOwner {
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);     // 调用铸币函数
        _setTokenURI(tokenId, uri); // tokenId和元数据绑定
    }

    // The following function are overrides required by Solidity

    function _update(address to, uint256 tokenId, address auth) 
    internal override(ERC721, ERC721Enumerable) returns (address) {
        return super._update(to, tokenId, auth);
    }

    function _increaseBalance(address account, uint128 value)
    internal override (ERC721, ERC721Enumerable) {
        super._increaseBalance(account, value);
    }

    function supportsInterface(bytes4 interfaceId)
    public view override (ERC721, ERC721Enumerable, ERC721URIStorage) returns (bool) {
        return super.supportsInterface(interfaceId);
    }

    function tokenURI(uint256 tokenId) 
    public view override (ERC721, ERC721URIStorage) returns (string memory) {
        return super.tokenURI(tokenId);
    }
}