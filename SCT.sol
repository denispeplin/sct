pragma solidity ^0.4.18;

contract SimpleCoinToken {
  string public constant name = "Simple Coin Token";
  string public constant symbol = "SCT";
  uint32 public constant decimals = 18;

  uint public totalSupply = 0;

  mapping (address => uint) balances;

  function mint(address _to, uint _value) public {
    assert(totalSupply + _value >= totalSupply && balances[_to] + _value >= balances[_to]);
    totalSupply += _value;
    balances[_to] += _value;
  }

  function balanceOf(address _owner) constant public returns (uint balance) {
    return balances[_owner];
  }

  function transfer(address _to, uint _value) public returns (bool success) {
    if (balances[msg.sender] >= _value && balances[_to] + _value >= balances[_to]) {
      balances[msg.sender] -= _value;
      balances[_to] += _value;
      Transfer(msg.sender, _to, _value);
      return true;
    }
    return false;
  }

  function transferFrom(address _from, address _to, uint _value) public returns (bool success) {
    if (balances[_from] >= _value && balances[_to] + _value >= balances[_to]) {
      balances[_from] -= _value;
      balances[_to] += _value;
      Transfer(_from, _to, _value);
      return true;
    }
    return false;
  }

  function approve(address _spender, uint _value) public returns (bool success) {
    return false;
  }

  function allowance(address _owner, address _spender) constant returns (uint remaining) {
    return 0;
  }

  event Transfer(address indexed _from, address indexed _to, uint _value);

  event Approval(address indexed _owner, address indexed _spender, uint _value);
}
