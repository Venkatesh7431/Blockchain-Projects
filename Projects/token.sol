// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract simpleToken{
    string public name = "SimpleToken";
    string public symbol = "ST";
    uint8 public decimals = 0;
    uint256 public totalSupply;
     address public owner;

    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor(uint256 _supply){
        totalSupply = _supply;
        balanceOf[msg.sender]= _supply;
    }

    function transfer(address _to, uint _value) external returns(bool){
        require(balanceOf[msg.sender] >= _value,"insufficient");
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
    function approve(address _spender, uint _value) external returns(bool){
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;

     }
    function transferFrom(address _from,address _to,uint256 _value) external returns(bool){
        require(balanceOf[_from] >= _value, "insufficient balance");
        require(allowance[_from][msg.sender] >= _value, "not approved");

        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;

        emit Transfer(_from, _to, _value);
        return true;
    }
    function mint(address _to, uint256 _amount) external{
        require(msg.sender == owner, "not owner");
        totalSupply += _amount;
        balanceOf[_to] += _amount;
        emit Transfer(address(0),_to, _amount);
    }
    function burn(uint256 _amount) external {
        require(balanceOf[msg.sender] >= _amount,"insufficient balance");
        balanceOf[msg.sender] -= _amount;
        totalSupply -= _amount;
        emit Transfer(msg.sender, address(0), _amount);

    }

}
