//部署指定合约HelloWorld
const HelloWorld = artifacts.require("HelloWorld");

module.exports = function(deployer) {
  deployer.deploy(HelloWorld);
};
//部署指定合约ExampleToken
// const ExampleToken = artifacts.require("ExampleToken");

// module.exports = function(deployer) {
//   deployer.deploy(ExampleToken);
// };