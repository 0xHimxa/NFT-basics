//SPDX-License-Identifier:MIT
pragma solidity ^0.8.18;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

//instead of using terminal we can use this from open they do same thing
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract MoodNft is ERC721 {
    enum Mood {
        Happy,
        sad
    }

    uint256 private s_tokenCounter;
    string private s_sadSvgImageUri;
    string private s_happSvgImageUri;

    mapping(uint256 => Mood) private s_tokenIdToMood;

    constructor(
        string memory sadSvgImgUri,
        string memory happySvgImgUri
    ) ERC721("Mood NFT", "MN") {
        s_tokenCounter = 0;
        s_happSvgImageUri = happySvgImgUri;
        s_sadSvgImageUri = sadSvgImgUri;
    }

    function mintNft() external {
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenIdToMood[s_tokenCounter] = Mood.Happy;
        s_tokenCounter++;
    }

    function _baseURI() internal pure override returns (string memory) {
        // we will use the in the fn below so that browers can read the imgl;mj
        return "data:application/json;base64,";
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        string memory imageURI;
        if (s_tokenIdToMood[tokenId] == Mood.Happy) {
            imageURI = s_happSvgImageUri;
        } else {
            imageURI = s_sadSvgImageUri;
        }

        // to join string together we use concate the the var: we call the name fn in their

        //string memory tokenMetedata = string.concat('{"name: " "',name(), '", "description": "An NFT that reflects the owners mood.", "attributes": [{"trait_type":"moodiness","value":100}], "image": "',imageURI,'"}');

        //or this why we use this is bc we wnat the data in bytes


//then we convert back to string
      return  string( 
        abi.encodePacked(
        //now we call that fn here

            _baseURI(),
            Base64.encode(
                bytes(
                    abi.encodePacked(
                        '{"name: " "',
                        name(),
                        '", "description": "An NFT that reflects the owners mood.", "attributes": [{"trait_type":"moodiness","value":100}], "image": "',
                        imageURI,
                        '"}'
                    )
                )
            )
        ) );
    }
}
