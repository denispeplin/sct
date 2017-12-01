pragma solidity ^0.4.18;

import "github.com/OpenZeppelin/zeppelin-solidity/contracts/token/MintableToken.sol";

contract SimpleCoinToken is MintableToken {
  string public constant name = "Simple Coin Token";
  string public constant symbol = "SCT";
  uint32 public constant decimals = 18;
}

contract Crowdsale {

  address owner;

  SimpleCoinToken public token = new SimpleCoinToken();

  uint start = 1512086400;

  uint period = 28;

  function Crowdsale() public {
    owner = msg.sender;
  }

  function() external payable {
    require(now > start && now < start + period*24*60*60);
    owner.transfer(msg.value);
    token.mint(msg.sender, msg.value);
  }
}
