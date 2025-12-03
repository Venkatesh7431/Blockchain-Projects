// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract MyMulitiToken is ERC1155 {
    uint256 public constant SWORD = 1;
    uint256 public constant SHIELD =2;

    constructor() ERC1155("https://myapi.com/metadata/{id}.json"){
        _mint(msg.sender, SWORD,10,"");
        _mint(msg.sender,SHIELD,1,"");
    }

}