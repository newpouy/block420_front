pragma solidity ^0.4.21;

contract Block420Token {
    address public owner;
    string public name = "Block420Token";
    string public symbol = "BTH";
    uint8 public decimals = 18; // 18 is standard token decimal
    uint public totalSupply = 0;
    
    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) internal allowed;
    
    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
    event Mint(address indexed to, uint amount);

    function Block420Token() public {
        owner = msg.sender;
    }
    
    function transfer(address _to, uint _value) public returns (bool) {
        require(_to != address(0)); //require 뒤에는 논리조건문이 온다.
        require(_value <= balances[msg.sender]);
        balances[msg.sender] = balances[msg.sender] - _value;
        balances[_to] = balances[_to] + _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }
    
    
    
    function mint(address _to, uint256 _amount) public returns (bool) {
        require(msg.sender == owner);
        totalSupply = totalSupply + _amount;
        balances[_to] = balances[_to] + _amount;
        emit Mint(_to, _amount);
        emit Transfer(address(0), _to, _amount);
        return true;
    }
}
