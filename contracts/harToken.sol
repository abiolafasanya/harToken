// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract HarToken is ERC20, Ownable {
    uint public perEth = 1000;
    constructor() ERC20("HarToken", "HCT") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

        function buyToken(address receiver, uint256 amount) public returns (uint256){
                
        uint256 _tokenAmount = amount * perEth;
        
        _mint(receiver, _tokenAmount);
        
        return _tokenAmount;
    }
}