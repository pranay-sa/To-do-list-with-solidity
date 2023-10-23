pragma solidity >=0.4.21 <0.6.0;

contract NewMigrations {
  address public newOwner;
  uint public newLastCompletedMigration;

  constructor() public {
    newOwner = msg.sender;
  }

  modifier newRestricted() {
    if (msg.sender == newOwner) _;
  }

  function setNewCompleted(uint newCompleted) public newRestricted {
    newLastCompletedMigration = newCompleted;
  }

  function upgradeToNewAddress(address newAddress) public newRestricted {
    NewMigrations upgraded = NewMigrations(newAddress);
    upgraded.setNewCompleted(newLastCompletedMigration);
  }
}
