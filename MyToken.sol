pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/SafeERC20.sol";

contract MyToken is SafeERC20 {
  string public name = "My Token";
  string public symbol = "MTK";
  uint8 public decimals = 18;
  uint public totalSupply;

  constructor(uint initialSupply) public {
    totalSupply = initialSupply;
    balanceOf[msg.sender] = initialSupply;
  }

  mapping(address => uint) public balanceOf;

  function transfer(address to, uint value) public {
    require(balanceOf[msg.sender] >= value && value > 0, "Insufficient balance");
    balanceOf[msg.sender] -= value;
    balanceOf[to] += value;
    emit Transfer(msg.sender, to, value);
  }

  function approve(address spender, uint value) public {
    require(balanceOf[msg.sender] >= value && value > 0, "Insufficient balance");
    allowed[msg.sender][spender] = value;
    emit Approval(msg.sender, spender, value);
  }

  function transferFrom(address from, address to, uint value) public {
    require(balanceOf[from] >= value && value > 0, "Insufficient balance");
    require(allowed[from][msg.sender] >= value, "Insufficient allowance");
    balanceOf[from] -= value;
    balanceOf[to] += value;
    allowed[from][msg.sender] -= value;
    emit Transfer(from, to, value);
  }
}
