pragma solidity >=0.7.0 <0.9.0;

library SafeMath {
  function add(uint a, uint b) internal pure returns(uint c) {
    c = a + b;
    require(c >= a);
  }
  function sub(uint a, uint b) internal pure returns(uint c) {
    require(b <= a);
    c = a - b;
  }
  function mul(uint a, uint b) internal pure returns(uint c) {
    c = a * b;
    require(a == 0 || c / a == b);
  }
  function div(uint a, uint b) internal pure returns(uint c) {
    require(b > 0);
    c = a / b;
  }
}

/**
 * 1. Finish LuckyMoneyCreator and LuckyMoney contract
 * 2. Design necessary events and use them
 * 3. Add necessary modifier(s) to predefined functions
 * 
 */

/** 
 * @title LuckyMoneyCreator
 * @dev Implements creating new lucky money envelope
 */
contract LuckyMoneyCreator {
    using SafeMath for uint;
    // storages
    mapping (address => LuckyMoney[]) user_contracts;
    
    constructor(){
        
      // todo
    }
    
    event CreateContract(address creator, LuckyMoney creator_contract, uint max_participants, uint fund);
    
    function create(uint max_participants) public payable returns(bool success) {
        //check max_participants is not zero
        require(max_participants > 0);
        //input max_participants and creator to LuckyMoney constructor
        LuckyMoney creator_address = new LuckyMoney(max_participants, msg.sender);
        
        user_contracts[msg.sender].push(creator_address);
        
        emit CreateContract(msg.sender, creator_address, max_participants, msg.value);
        
        return true;
    }
    
    /**
     * @dev return all LuckyMoney created by the given user
     * 
     */
    function query(address user) external view returns(LuckyMoney[] memory) {
        return user_contracts[user];
    }
}

/**
 * 
 * @dev 
 * 
 */
contract LuckyMoney {
    using SafeMath for uint;
    
    uint max_number;
    uint LuckyMoney_amount=msg.value;
    address owner;
    address[] roll_participants;
    
    event Rool(address account, uint reward);
    event Refund(address owner, uint token);
    
    constructor(uint max_participants, address creator) {
        // todo
        max_number = max_participants;  
        owner = creator;
    }
    
    modifier onlyOwner() {
        require(owner == msg.sender, 'You are not owner');
        _;
    }
    
    modifier max_participants_limit() {
        require(max_number >= roll_participants.length,"failed: participants is overflow");
        _;
    }
    
    /**
     * @dev return all participants
     * 
     */
    function participants() external view returns(address[] memory){
        return roll_participants;
    }
    
    /**
     * @dev anyone can roll and get rewarded a random amount of remnant eth from the contract
     * as long as doesn't exceed max_participants
     * each account can only roll once
     * 
     */
    function roll() public max_participants_limit{
        uint roll_len = roll_participants.length;
        
        // check account not get?
        for(uint i = 0;i <=roll_len; i++) {
            require(msg.sender != roll_participants[i],"failed: account already get rewarded");
        }
        // add account to roll_participants
        roll_participants[roll_len] = msg.sender;
        //get random reward
        uint reward = random();
        // transfer token to account
        msg.sender.call{value: reward};
        
        emit Rool(msg.sender, reward);
        
    }
    
    /**
     * @dev generate a random uint
     * 
     */
    function random() private returns(uint){
        //check LuckyMoney_amount
        require(LuckyMoney_amount > 0);
        
        uint randomNumber = uint(
            uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty, max_number))) % LuckyMoney_amount
        );
        
        //replace safe math ***
        LuckyMoney_amount = LuckyMoney_amount.sub(randomNumber);
        
        
        return randomNumber;
    }
    
    /**
     * @dev only owner can call
     * refund remant eth and destroy itself
     * 
     */
    function refund() public onlyOwner{
        //send fund to owner
        owner.call{value: LuckyMoney_amount};
        
        emit Refund(owner, LuckyMoney_amount);
        
        //destroy this contract
        //selfdestruct(owner);
    }
    
    
}
