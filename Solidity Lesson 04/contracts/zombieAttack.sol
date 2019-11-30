pragma solidity ^0.5.12;

import "./zombieHelper.sol";

contract ZombieAttack is ZombieHelper {
  uint randNonce = 0;
  uint attackVictoryProbability = 70;

  function randMod(uint _modulus) internal returns(uint) {
    randNonce++;
    return uint(keccak256(abi.encodePacked(now, msg.sender, randNonce))) % _modulus;
  }
  function setAttackVictoryProbability(uint _attackVictoryProbability)public onlyOwner{
      attackVictoryProbability = _attackVictoryProbability;
  }

  function attack(uint16 _zombieId, uint16 _targetId) external onlyOwnerOf(_zombieId) {
    Zombie storage myZombie = zombies[_zombieId];
    Zombie storage enemyZombie = zombies[_targetId];
    uint rand = randMod(100);
    if (rand <= attackVictoryProbability) {
      myZombie.winCount++;
      myZombie.level++;
      enemyZombie.lossCount++;
      multiply(_zombieId, enemyZombie.dna);
    } else {
      myZombie.lossCount++;
      enemyZombie.winCount++;
     _triggerCooldown(myZombie);
    }
  }
}