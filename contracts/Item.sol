// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.12;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Pausable.sol";

contract Item is ERC721Enumerable, ERC721Pausable {

    constructor(string memory name_, string memory symbol_) ERC721(name_, symbol_) {}

    function _beforeTokenTransfer(address from, address to, uint256 tokenId) internal override(ERC721Enumerable, ERC721Pausable) {
        ERC721Pausable._beforeTokenTransfer(from, to, tokenId);
        ERC721Enumerable._beforeTokenTransfer(from, to, tokenId);
    }

    function supportsInterface(bytes4 interfaceId) public view override(ERC721, ERC721Enumerable) returns (bool) {
        return ERC721.supportsInterface(interfaceId)
            || ERC721Enumerable.supportsInterface(interfaceId);
    }

    function mintNft() external {
        uint256 currentSupply_ = totalSupply();
        _mint(msg.sender, currentSupply_);
    }
}