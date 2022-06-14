pragma solidity 0.5.0;

contract Election {
    struct Candidate {
        uint256 id;
        string name;
        uint256 voteCount;
    }
    //store accounts that have voted
    mapping(address =>bool) public voters;
    mapping(uint256 => Candidate) public candidates;

    //Candidate Count
    uint public candidatesCount;

    constructor() public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");

    }


function addCandidate (string memory _name) private {
    candidatesCount++;
    candidates[candidatesCount] = Candidate(candidatesCount,_name,0);
}

function vote(uint _candidateId) public {
//require that voter has not voted before
require(!voters[msg.sender]);

//require a valid candidate
require((_candidateId>0 && _candidateId <=candidatesCount));

//record that voter has voted
voters[msg.sender]=true;

//update candidate votecount
candidates[_candidateId].voteCount++;

}

}