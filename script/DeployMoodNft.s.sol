//SPDX-License-Identifier:MIT
pragma solidity ^0.8.18;
import {Script,console} from "forge-std/Script.sol";
import {MoodNft} from "src/MoodNft.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DeployMoodNft is Script{

function run() external returns(MoodNft){}

function svgToImageURI(string memory svg) external pure returns(string memory){

string memory baseURl = "data:image/svg+xml;base64,";

string memory svgBase64Encoded = Base64.encode(abi.encodePacked(svg));
//svgBase64Encoded = Base64.encode(bytes(svg));

string memory val = string(abi.encodePacked(baseURl, svgBase64Encoded));

console.log(val);
//return baseURl + Base64.encode(bytes(svg));


return val;





}





}
