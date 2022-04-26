pragma solidity >=0.4.22 <=0.8.13;

contract HelloWorld{
    string _name;
    function setName(string memory name) public{
        _name = name;
    }
    //memory 5.0版本必须指定，string 入参
    function getName() public view returns(string memory){
        return _name;
    }
}