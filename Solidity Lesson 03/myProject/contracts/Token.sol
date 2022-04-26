pragma solidity >=0.4.22 <=0.8.13;
//从 NPM 导入 @openzeppelin
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Detailed.sol";
contract ExampleToken is ERC20, ERC20Detailed {
  constructor () public
  ERC20Detailed("CuiToken", "CUI", 18){
    _mint(msg.sender,10000000000 * (10 ** uint256(decimals())));
  }
}