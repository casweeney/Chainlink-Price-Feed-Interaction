// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract PriceConsumerV3 {

    AggregatorV3Interface internal priceFeed;
    AggregatorV3Interface internal dynamicFeed;

    /**
        * Network: Goerli
        * Aggregator: ETH/USD
        * Address: 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
     */

     /**
        * Network: Goerli
        * Aggregator: BTC/USD
        * Address: 0xA39434A63A52E749F02807ae27335515BA4b07F7
      */
    constructor() {
        // BTC/USD
        priceFeed = AggregatorV3Interface(0xA39434A63A52E749F02807ae27335515BA4b07F7);
    }

    /**
     * Returns the latest price
     */
    function getLatestPrice() public view returns (int) {
        (
            /*uint80 roundID*/,
            int price,
            /*uint startedAt*/,
            /*uint timeStamp*/,
            /*uint80 answeredInRound*/
        ) = priceFeed.latestRoundData();
        return price;
    }

    function setFeedAddress (address _addr) external {
        dynamicFeed = AggregatorV3Interface(_addr);
    }

    function getLatestCoinPrice() external view returns (int) {
        (
            /*uint80 roundID*/,
            int price,
            /*uint startedAt*/,
            /*uint timeStamp*/,
            /*uint80 answeredInRound*/
        ) = dynamicFeed.latestRoundData();
        return price;
    }
}