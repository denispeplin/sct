pragma solidity ^0.4.18;

import "github.com/OpenZeppelin/zeppelin-solidity/contracts/token/MintableToken.sol";

contract SimpleCoinToken is MintableToken {
  string public constant name = "Simple Coin Token";
  string public constant symbol = "SCT";
  uint32 public constant decimals = 18;
}

contract Crowdsale {

  using SafeMath for uint;

  address miltisig;

  uint restrictedPercent;

  address restricted;

  SimpleCoinToken public token = new SimpleCoinToken();

  uint start;

  uint period;

  uint hardcap;

  uint rate;

  function Crowdsale() public {
    multisig = 0xEA15Adb66DC92a4BbCcC8Bf32fd25E2e86a2A770;
    restricted = 0xb3eD172CC64839FB0C0Aa06aa129f402e994e7De;
    restrictedPercent = 40;
    rate = 100000000000000000000;
    start = 1512086400;
    period = 28;
    hardcap = 10000000000000000000000;
  }

  modifier saleIsOn() {
    require(now > start && now < start + period * 1 days);
    _;
  }

  modifier isUnderHardCap() {
    require(multisig.balance < hardcap);
    _;
  }

  function finishMinting() public onlyOwner {
    uint issuedTokenSupply = token.totalSupply();
    uint restrictedTokens = issuedTokenSupply.mul(restrictedPercent).div(100 - restrictedPercent);
    token.mint(restricted, restrictedTokens);
    token.finishMinting();
  }

  function createTokens() isUnderHardCap saleIsOn payable {
    multisig.transfer(msg.value);
    uint tokens = rate.mul(msg.value).div(1 ether);
    token.mint(msg.sender, tokens);
  }

  function() external payable {
    createTokens();
  }
}
