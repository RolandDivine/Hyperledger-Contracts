pragma solidity ^0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC20/SafeERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/math/SafeMath.sol";

/**

@title ReflectionToken
@dev Token that reflects a portion of each transaction back to the sender.
@dev Implements ERC20 using OpenZeppelin's SafeERC20.
*/
contract ReflectionToken is SafeERC20 {
using SafeMath for uint256;
string public name = "Reflection Token";
string public symbol = "RFT";
uint8 public decimals = 18;

// The percentage of the transaction amount to be reflected back to the sender.
uint256 public reflectionPercentage = 15;

/**

@dev Constructor that initializes the total supply and assigns all tokens to the contract creator.
*/
constructor() public {
totalSupply_ = 0;
balances[msg.sender] = totalSupply_;
}
/**

@dev Overrides the default transfer function to also reflect a portion of the transaction
back to the sender.
@param _to The address of the recipient.
@param _value The amount of tokens to be transferred.
*/
function transfer(address _to, uint256 _value) public returns (bool) {
require(_to != address(0));
require(_value <= balances[msg.sender]);
Copy code
// Calculate the reflection amount and add it to the sender's balance.
Copy code
uint256 reflectionAmount = _value.mul(reflectionPercentage).div(100);
balances[msg.sender] = balances[msg.sender].add(reflectionAmount);

// Transfer the remaining amount to the recipient.
_value = _value.sub(reflectionAmount);
super.transfer(_to, _value);

return true;
}
}
