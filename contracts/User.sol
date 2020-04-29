pragma solidity >=0.4.22 <0.6.0;

contract OwnedToken {
   struct Part {
   uint pNumber;
   string pName;
   string pDesc;
   string pManuf;
   string[] owners;
}
mapping(uint => Part) public part_store;
uint public partsCount;
  event ValueChanged(uint256 part);
function createPart (string memory _pName, string memory _pDesc, string memory _pManuf) public {
        partsCount++;
        part_store[partsCount].pNumber = partsCount;
        part_store[partsCount].pName = _pName;
        part_store[partsCount].pDesc = _pDesc;
        part_store[partsCount].pManuf = _pManuf; 
        part_store[partsCount].owners.push(_pManuf);
		 emit ValueChanged(partsCount);
        /* Trigger event */
       // emit partCreatedEvent(partsCount);
    }
}