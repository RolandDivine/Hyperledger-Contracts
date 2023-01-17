pragma solidity ^0.8.0;

contract InsuranceClaim {
    // Event to emit when a claim is submitted
    event ClaimSubmitted(address claimant, uint claimId);
    // Event to emit when a claim is approved
    event ClaimApproved(uint claimId);
    // Event to emit when a claim is denied
    event ClaimDenied(uint claimId);

    // Mapping to store claim information
    mapping(uint => Claim) public claims;
    // Struct to hold claim information
    struct Claim {
        address claimants;
        uint claimId;
        bool approved;
        bool denied;
    }

    // Function to submit a claim
    function submitClaim(address claimants) public {
        uint claimId = claims.length;
        claims[claimId] = Claim(claimants, claimId, false, false);
        emit ClaimSubmitted(claimants, claimId);
    }

    // Function to approve a claim
    function approveClaim(uint claimId) public {
        // Ensure claim exists
        require(claims[claimId].claimId == claimId);
        // Ensure claim has not already been approved or denied
        require(!claims[claimId].approved && !claims[claimId].denied);
        claims[claimId].approved = true;
        emit ClaimApproved(claimId);
    }

    // Function to deny a claim
    function denyClaim(uint claimId) public {
        // Ensure claim exists
        require(claims[claimId].claimId == claimId);
        // Ensure claim has not already been approved or denied
        require(!claims[claimId].approved && !claims[claimId].denied);
        claims[claimId].denied = true;
        emit ClaimDenied(claimId);
    }
}
