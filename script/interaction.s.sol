//SPDX-License-Identifier:MIT
pragma solidity ^0.8.18;
import {Script} from "forge-std/Script.sol";
import {BasicNft} from "src/basic-nft.sol";
import {DevOpsTools} from 'lib/foundry-devops/src/DevOpsTools.sol';

contract InteractBasicNft is Script{

string public constant  PUG = "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

// function mintNftOnContract (address contractAddr) external {

// vm.startBroadcast();
// BasicNft(contractAddr).mintNft(PUG);
// vm.stopBroadcast();



// }

// function run() external returns(BasicNft){

// address mostRecentlyDeploy = DevOpsTools.get_most_recent_deployment("BasicNft", block.chainid);
// mintNftOnContract(mostRecentlyDeploy);



//}




}