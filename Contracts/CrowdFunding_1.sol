// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract CrowdFunding {
    struct Campaign{
        address owner;
        string title;
        string description;
        uint256 target;
        uint256 deadline;
        uint256 amountCollected;
        string image;
        address[] donators;
        uint256[] donations; 
    }

    Campaign[] public campaigns;

    uint256 public numberOfCampaigns = 0;

    function createCampaign(address _owner, string memory _title, string memory _des, uint256 _target, uint256 _deadline, string memory _image) public returns(uint256) {
        //check if all okey
        // require( < block.timestamp, "deadline should be a future date");
        address[] memory _donators;
        uint256[] memory _donations;
        Campaign memory campaign = Campaign(_owner,_title ,_des,_target ,_deadline ,0 ,_image ,_donators, _donations ); 
        require(campaign.deadline > block.timestamp, "deadline should be a future date");
        campaigns.push(campaign);
        numberOfCampaigns += 1;
        return numberOfCampaigns - 1;
    }

    function donateToCampaign(uint256 _id) public payable {
        uint256 amount = msg.value;

        Campaign storage campaign = campaigns[_id];

        campaign.donators.push(msg.sender);
        campaign.donations.push(amount);

        (bool sent, ) = payable(campaign.owner).call{value: amount}("");
        
        if(sent){
            campaign.amountCollected += amount;
        }
    }

    function getDonators(uint256 _id) public view returns(address[] memory, uint256[] memory) {
        return(campaigns[_id].donators, campaigns[_id].donations);
    }

    function getCampaigns() public view returns(Campaign[] memory) {
         Campaign[] memory allcampaigns =  new Campaign[](numberOfCampaigns);
         for(uint i = 0; i<numberOfCampaigns; i++){
            // // dhek lena phir se
            // allcampaigns[i] = campaigns[i];

            // he wrote like this, see if any problem happens
            Campaign storage item = campaigns[i];
            allcampaigns[i] = item;

         }
         return allcampaigns;
    }

    function deleteCampaign() public returns(uint){
        for(uint i = 0; i<numberOfCampaigns; i++){
            if(campaigns[i].deadline < block.timestamp){
                campaigns[i] = campaigns[numberOfCampaigns-1];
                campaigns.pop();
                numberOfCampaigns--;
            }
        }
        return numberOfCampaigns;
    }

}