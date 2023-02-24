//SPDX-License-Identifier: MIT
 pragma solidity ^0.8.7;

 contract WithoutModifier{
     bool public paused;
     uint public count;

     function setPaused(bool _paused) external{
         paused = _paused;
     }

     function inc() external{
         require (!paused, "paused");
         count += 1;
     }

     function dec() external{
         require(!paused, "paused");
         count -= 1;
     }
 }

 contract WithModifier{
     bool public paused;
     uint public cnt;

     function setPaused(bool _paused) external{
         paused = _paused;
     }

     modifier whenNotPaused() {
         require(!paused , "paused");
         _;
     }

     function inc() external whenNotPaused{
         cnt += 1;
     }

     function dec() external whenNotPaused{
         cnt -= 1;
     }
 }