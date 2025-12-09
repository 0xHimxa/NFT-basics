//SPDX-License-Identifier:MIT
pragma solidity ^0.8.18;
import {Script,console} from "forge-std/Script.sol";
import {MoodNft} from "src/MoodNft.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DeployMoodNft is Script{



function run() external returns(MoodNft){
// here we read the svg file;

string memory happySvg = vm.readFile('./img/happ.svg');
string memory sadSvg = vm.readFile('./img/sad.svg');


vm.startBroadcast();

MoodNft moodNft = new MoodNft(svgToImageURI(sadSvg), svgToImageURI(sadSvg));

vm.stopBroadcast();

return moodNft;




}

function svgToImageURI(string memory svg) public pure returns(string memory){

string memory baseURl = "data:image/svg+xml;base64,";

string memory svgBase64Encoded = Base64.encode(abi.encodePacked(svg));
//svgBase64Encoded = Base64.encode(bytes(svg));

string memory val = string(abi.encodePacked(baseURl, svgBase64Encoded));

console.log(val);
//return baseURl + Base64.encode(bytes(svg));


return val;





}





}
