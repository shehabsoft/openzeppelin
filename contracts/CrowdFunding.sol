pragma solidity >=0.4.11 <0.7.0;

contract CrowdFunding {
 

    struct Campaign {
        uint256 fundingGoal;
        uint256 numFunders;
        uint256 amount;
    
    }

    uint256 numCampaigns;
    mapping (uint256 => Campaign) campaigns;

    function newCampaign( uint goal) public  returns (uint campaignID) {
        campaignID = numCampaigns++; // campaignID is return variable
        // Creates new struct in memory and copies it to storage.
        // We leave out the mapping type, because it is not valid in memory.
        // If structs are copied (even from storage to storage),
        // types that are not valid outside of storage (ex. mappings and array of mappings)
        // are always omitted, because they cannot be enumerated.
        campaigns[campaignID] = Campaign( goal, 0, 0);
    }

    function contribute(uint campaignID) public payable {
        Campaign storage c = campaigns[campaignID];
        // Creates a new temporary memory struct, initialised with the given values
        // and copies it over to storage.
        // Note that you can also use Funder(msg.sender, msg.value) to initialise.
      
        c.amount += msg.value;
    }

    function checkGoalReached(uint campaignID) public returns (bool reached) {
        Campaign storage c = campaigns[campaignID];
        if (c.amount < c.fundingGoal)
            return false;
        uint256 amount = c.amount;
        c.amount = 0;
      //  c.beneficiary.transfer(amount);
        return true;
    }
	
	 function retrieve(uint campaignID) public view returns (  uint amount) {
        Campaign storage c=campaigns[campaignID];
		return c.amount;
    }

	 


 

}