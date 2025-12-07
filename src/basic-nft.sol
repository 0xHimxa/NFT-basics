//SPDX-License-Identifier:MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
//each nft have unique token id

contract BasicNft is ERC721{
uint256 private s_tokenCounter;

mapping(uint256=> string) private s_tokenURI;


constructor()ERC721("Dogie","DOG"){
s_tokenCounter = 0;

}

function mintNft(string memory _tokenURI) external {
  s_tokenURI[s_tokenCounter] = _tokenURI;
  _safeMint(msg.sender, s_tokenCounter);
  s_tokenCounter++;
}

//

function tokenURI(uint256 tokenId)public  view  override returns(string memory){


 return s_tokenURI[tokenId];
}

}