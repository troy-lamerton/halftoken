var HalfCoin = artifacts.require('./HalfCoin.sol');

module.exports = function(deployer) {
  deployer.deploy(HalfCoin);
};
