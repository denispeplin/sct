pragma solidity ^0.4.18;

import "github.com/OpenZeppelin/zeppelin-solidity/contracts/token/MintableToken.sol";

contract SimpleCoinToken is MintableToken {
  string public constant name = "Simple Coin Token";
  string public constant symbol = "SCT";
  uint32 public constant decimals = 18;
}
