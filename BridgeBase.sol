// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

interface IWrappedToken {
    function mint(address to, uint256 amount) external;
    function burn(address from, uint256 amount) external;
}

contract BridgeBase is Ownable {
    IERC20 public token;
    IWrappedToken public wrappedToken;

    event TokensLocked(address indexed requester, uint256 amount, uint256 timestamp);
    event TokensMinted(address indexed requester, uint256 amount, uint256 timestamp);

    constructor(address _token, address _wrappedToken) Ownable(msg.sender) {
        token = IERC20(_token);
        wrappedToken = IWrappedToken(_wrappedToken);
    }

    // Call this on Source Chain
    function lock(uint256 amount) external {
        token.transferFrom(msg.sender, address(this), amount);
        emit TokensLocked(msg.sender, amount, block.timestamp);
    }

    // Call this on Destination Chain (Only Owner/Relayer)
    function mintWrapped(address requester, uint256 amount) external onlyOwner {
        wrappedToken.mint(requester, amount);
        emit TokensMinted(requester, amount, block.timestamp);
    }
}
