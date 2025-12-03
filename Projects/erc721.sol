// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/v4.9.0/contracts/token/ERC721/ERC721.sol";
import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/v4.9.0/contracts/utils/Strings.sol";

contract MyNft is ERC721 {
    uint256 public nextTokenId;

    constructor() ERC721("MyNft", "MNFT") {}

    function mint() external {
        _safeMint(msg.sender, nextTokenId);
        nextTokenId++;
    }
}
