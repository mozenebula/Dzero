//This is the token contract for the Dzero

pragma solidity ^0.4.18;
contract Dzero {
    string public name = "Dzero";
    string public symbol = "DZ";
    string public standard = "Dzero v1.0";
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    //event
    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );
    //event
    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

    //constructor
    constructor (uint256 _initialSupply) public {
        balanceOf[msg.sender] = _initialSupply;
        totalSupply = _initialSupply;
    }

    //transfer
    function transfer(address _to, uint256 _value) public returns (bool success) {
        //exception if account doesn't have enough
        require(balanceOf[msg.sender] >= _value);
        //transfer the balance
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        //transfer event
        emit Transfer(msg.sender, _to, _value);
        //return a boolean
        return true;
    }

    //approve
    function approve(address _spender, uint256 _value) public returns (bool success) {
        //allowance
        allowance[msg.sender][_spender] = _value;
        //approve event
        emit Approval(msg.sender, _spender, _value);
        //return a boolean
        return true;
    }

    //transferFrom
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        //require _from has enough tokens
        require(_value <= balanceOf[_from]);
        //require allowance is big enough
        require(_value <= allowance[_from][msg.sender]);
        //change the balance
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        //update the allowance
        allowance[_from][msg.sender] -= _value;
        //transfer event
        emit Transfer(_from, _to, _value);
        //return a boolean
        return true;
    }


    //stake
    function stake(uint256 _value) public returns (bool success) {
        //require _from has enough tokens
        require(_value <= balanceOf[msg.sender]);
        //change the balance
        balanceOf[msg.sender] -= _value;
        balanceOf[address(this)] += _value;
        //transfer event
        emit Transfer(msg.sender, address(this), _value);
        //return a boolean
        return true;
    }

    //unstake
    function unstake(uint256 _value) public returns (bool success) {
        //require _from has enough tokens
        require(_value <= balanceOf[address(this)]);
        //change the balance
        balanceOf[address(this)] -= _value;
        balanceOf[msg.sender] += _value;
        //transfer event
        emit Transfer(address(this), msg.sender, _value);
        //return a boolean
        return true;
    }

    //burn
    function burn(uint256 _value) public returns (bool success) {
        //require _from has enough tokens
        require(_value <= balanceOf[msg.sender]);
        //change the balance
        balanceOf[msg.sender] -= _value;
        totalSupply -= _value;
        //transfer event
        emit Transfer(msg.sender, address(0), _value);
        //return a boolean
        return true;
    }

    //mint
    function mint(uint256 _value) public returns (bool success) {
        //require _from has enough tokens
        require(_value <= balanceOf[msg.sender]);
        //change the balance
        balanceOf[msg.sender] += _value;
        totalSupply += _value;
        //transfer event
        emit Transfer(address(0), msg.sender, _value);
        //return a boolean
        return true;
    }

    //burnFrom
    function burnFrom(address _from, uint256 _value) public returns (bool success) {
        //require _from has enough tokens
        require(_value <= balanceOf[_from]);
        //require allowance is big enough
        require(_value <= allowance[_from][msg.sender]);
        //change the balance
        balanceOf[_from] -= _value;
        totalSupply -= _value;
        //update the allowance
        allowance[_from][msg.sender] -= _value;
        //transfer event
        emit Transfer(_from, address(0), _value);
        //return a boolean
        return true;
    }

    //mintFrom
    function mintFrom(address _from, uint256 _value) public returns (bool success) {
        //require _from has enough tokens
        require(_value <= balanceOf[_from]);
        //require allowance is big enough
        require(_value <= allowance[_from][msg.sender]);
        //change the balance
        balanceOf[_from] += _value;
        totalSupply += _value;
        //update the allowance
        allowance[_from][msg.sender] -= _value;
        //transfer event
        emit Transfer(address(0), _from, _value);
        //return a boolean
        return true;
    }

    //approveFrom
    function approveFrom(address _from, address _spender, uint256 _value) public returns (bool success) {
        //allowance
        allowance[_from][_spender] = _value;
        //approve event
        emit Approval(_from, _spender, _value);
        //return a boolean
        return true;
    }

}