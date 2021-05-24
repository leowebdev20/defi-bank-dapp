// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.8.5;  

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
  //add minter variable
  address public minter;

  //add minter changed event
  event MinterChanged(address indexed from, address to);

  constructor() public payable ERC20("DeFi Bank", "DFB") {
    minter = msg.sender;
    //asign initial minter
  }

  function passMinterRole(address dBank) public returns (bool) {
      require(msg.sender == minter, 'Error, only owner can change pass minter role');
      minter = dBank;

      emit MinterChanged(msg.sender, dBank);
      return true;
  }

  //Add pass minter role function

  function mint(address account, uint256 amount) public {
    //check if msg.sender have minter role
        require(msg.sender == minter, 'Error, not the minter');
		_mint(account, amount);
	}
}