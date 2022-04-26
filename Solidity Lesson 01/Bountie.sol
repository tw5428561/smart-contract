pragma solidity ^0.5.0;
/**
* @author tianwei
* 简单的一个合约赏金练习
*/
contract Bountie {
 /**
  * Enums 枚举 创建，认可，取消
  */
  enum BountyStatus { CREATED, ACCEPTED, CANCELLED }

  /*
  * 定义一个公共的Bounty的数组名： bounties
  */
  Bounty[] public bounties;

  /*
  * 属性Bounty定义
  */
  struct Bounty {
    address issuer;
    uint deadline;
    string data;
    BountyStatus status;
    uint amount; //in wei
  }
  /**
  * @dev Contructor
  */
  constructor() public {}

  /**
  * issueBounty()发放赏金功能
  * 该函数issueBounty接收一个字符串内存_data和一个整数_deadline作为参数（要求作为字符串，截止日期作为 UNIX 时间戳）
  * returns(uint)这意味着我们返回一个 uint（作为 ID 的赏金的数组索引）
  */
  function issueBounty(
  string memory _data,//由于string是一个字节数组，我们必须明确指定参数的数据位置_data。我们指定memory，因为我们不想在事务完成时存储此数据
  uint64 _deadline
  )
  public
  payable//为了将 ETH 发送到我们的合约，我们需要在函数中添加 payable 关键字 payable是 Solidity 中的预定义修饰符。它验证在调用需要为智能合约提供资金的函数时发送了 ETH
  hasValue()
  validateDeadline(_deadline)
  returns (uint)
  {
    //bounties数组插入bounty对象数据
    bounties.push(Bounty(msg.sender, _deadline, _data, BountyStatus.CREATED, msg.value));
    emit BountyIssued(bounties.length - 1,msg.sender, msg.value, _data,now);
    return (msg.value);
  }

  /**
  * hasValue()添加以确保msg.value是非零值
  */
  modifier hasValue() {
    require(msg.value > 0);
    _;
  }
  /**
  *日期校验方法
  *我们使用modifier关键字来声明一个修饰符，像函数这样的修饰符可以接收自己的参数
  */
  modifier validateDeadline(uint _newDeadline) {
    require(_newDeadline > now);//该require关键字允许您设置条件如果不满足，则停止执行
    _;
  }

  /**
  * solidity 事件在 EVM 的日志
  * bountyId:已发行赏金的 id
  * issuer：发放赏金的用户的账户
  * 金额：分配给赏金的 Weis 金额
  * 数据：作为字符串的赏金要求
  * 时间
  */
  event BountyIssued(uint bounty_id, address issuer, uint amount, string data,uint time);
}