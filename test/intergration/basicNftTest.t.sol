//SPDX-License-Identifier:MIT
pragma solidity ^0.8.18;

import {Test} from 'forge-std/Test.sol';
import {BasicNft} from "src/basic-nft.sol";
 import {DeployBasicNft} from "script/Deploy-basicNft.s.sol";

contract BasicNftTest is Test{

 BasicNft basicNft;
 DeployBasicNft deployBasicNft;
 address USER = makeAddr("user");
string private constant _tokenURI =  "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

 function setUp() external {

    deployBasicNft = new DeployBasicNft();
    basicNft = deployBasicNft.run();
 
vm.deal(USER, 100 ether);
 }

 function testNameIsCorrect() external view {

    string memory expectedName ="Dogie";
    string memory actuallName = basicNft.name();

    // so string are dynamic array they cant be compare with assert to assertEq
    //so we do this
    //we  do this it convert then to bytes  then hash them if thier hash is same means thy are same

    assert(keccak256(abi.encodePacked(expectedName)) == keccak256(abi.encodePacked(actuallName)));


} 
 

 function testCanMintHaveBalance() external {
   vm.prank(USER);
   basicNft.mintNft(_tokenURI);

   assert(basicNft.balanceOf(USER) == 1);
   assert(keccak256(abi.encodePacked(_tokenURI)) == keccak256(abi.encodePacked(basicNft.tokenURI(0))));
 }

}