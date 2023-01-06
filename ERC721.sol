pragma solidity ^0.8.0;

import "@hyperledger/cactus-core-api-erc721/contracts/cactus_core_api_erc721.sol";

/**
 * @title ERC721 token
 *
 * @dev Implementation of the ERC721 standard.
 *
 * @see https://eips.ethereum.org/EIPS/eip-721
 */
contract ERC721 is cactus_core_api_erc721 {
  constructor() public {
    // Set the name and symbol of the token
    setName("My ERC721 Token");
    setSymbol("MT");
  }
}
