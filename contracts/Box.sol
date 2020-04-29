pragma solidity ^0.5.0;
// Import Ownable from the OpenZeppelin Contracts library
//import "@openzeppelin/contracts/ownership/Ownable.sol";
//import "./access-control/Auth.sol"; 
contract Box  {


    uint256 private value;
	// Auth private auth;
    // Emitted when the stored value changes
    event ValueChanged(uint256 newValue);

    // Stores a new value in the contract
    function store(uint256 newValue) public {
	 //   require(auth.isAdministrator(msg.sender), "Unauthorized");
        value = newValue;
        emit ValueChanged(newValue);
    }

    // Reads the last stored value
    function retrieve() public view returns (uint256) {
        return value;
    }
	}