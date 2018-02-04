pragma solidity ^0.4.18;

import "zeppelin-solidity/contracts/token/ERC20/BasicToken.sol";
import "zeppelin-solidity/contracts/ownership/Ownable.sol";

contract HalfCoin is BasicToken, Ownable {
  string public constant name = "HalfCoin";
  string public constant symbol = "HALF";
  uint8 public constant decimals = 18;
  uint public initialSupply;

  function HalfCoin() public {
    initialSupply = 10 ether;
    balances[msg.sender] = initialSupply;
  }

  function transfer(address _to, uint _value) public returns (bool) {
    require(_to != address(0));
    require(_value <= balances[msg.sender]);

    // SafeMath.sub will throw if there is not enough balance.
    balances[msg.sender] = balances[msg.sender].sub(_value / 2);
    balances[_to] = balances[_to].add(_value);
    totalSupply_ += _value / 2;
    Transfer(msg.sender, _to, _value); // transfer event fired
    return true;
  }
}
