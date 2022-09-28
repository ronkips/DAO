// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract FakeNFTMarketplace {
    /// @dev Mantain a mapping of fake TokenId to Owner address
    mapping(uint256 => address) public tokens;
    // @dev set the purchase price for each Fake NFT
    uint256 nftPrice = 0.01 ether;

    // @dev purchase() accepts ETH and marks the owner of the given tokenId as the caller address
    // @param _tokenId - the fake NFT token Id to purchase
    function purchase(uint256 _tokenId) external payable {
        require(msg.value == nftPrice, "This NFT cost 0.01 ether");
        tokens[_tokenId] = msg.sender;
    }

    /// @dev getPrice() returns the price of one NFT
    function getPrice() external view returns (uint256) {
        return nftPrice;
    }

    /// @dev available() checks whether the given tokenId has already been sold or not
    /// @param _tokenId - the tokenId to check for
    function available(uint256 _tokenId) external view returns (bool) {
        //adress (o) = defaulr address in solidity
        if (tokens[_tokenId] == address(0)) {
            return true;
        }
        return false;
    }
}
