pragma solidity ^0.4.24;

import "https://github.com/hyperledger/fabric-chaincode-evm/blob/master/evmcc/src/main/go/security_token.sol";

/**
 * @title SecurityToken
 * @dev This contract implements the ERC1400 standard for security tokens.
 */
contract SecurityToken is StandardSecurityToken {
  // Set the name and symbol of the security token
  string public name = "Security Token";
  string public symbol = "ST";

  // Set the number of decimals
  uint8 public decimals = 18;

  // Set the total supply of the token
  uint public totalSupply = 1000000;

  // Set the token owner
  address public owner;

  /**
   * @dev Constructor function
   * @param _owner The address of the token owner
   */
  constructor(address _owner) public {
    owner = _owner;
    balanceOf[owner] = totalSupply;
  }

  /**
   * @dev Function to issue new tokens
   * @param _to The address to issue the tokens to
   * @param _value The number of tokens to issue
   */
  function issue(address _to, uint _value) public onlyOwner {
    balanceOf[_to] = balanceOf[_to].add(_value);
    totalSupply = totalSupply.add(_value);
  }

  /**
   * @dev Function to redeem tokens
   * @param _from The address to redeem the tokens from
   * @param _value The number of tokens to redeem
   */
  function redeem(address _from, uint _value) public onlyOwner {
    balanceOf[_from] = balanceOf[_from].sub(_value);
    totalSupply = totalSupply.sub(_value);
  }
}
