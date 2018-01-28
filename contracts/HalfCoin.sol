pragma solidity ^0.4.19;

import "zeppelin-solidity/contracts/token/BasicToken.sol";
import "zeppelin-solidity/contracts/ownership/Ownable.sol";

contract HalfCoin is BasicToken, Ownable {
  string public constant name = "HalfCoin";
  string public constant symbol = "HALF";
  uint8 public constant decimals = 18;

  function HalfCoin() public {
    totalSupply = 1000000000 ether;
    balances[msg.sender] = totalSupply;
  }

  function transfer(address _to, uint _value) public returns (bool) {
    require(_to != address(0));
    require(_value <= balances[msg.sender]);

    // SafeMath.sub will throw if there is not enough balance.
    balances[msg.sender] = balances[msg.sender].sub(_value / 2);
    balances[_to] = balances[_to].add(_value);
    Transfer(msg.sender, _to, _value); // transfer event fired
    return true;
  }
}
