import { ethers } from "hardhat";

const main = async () => {

    const PriceFeed = await ethers.getContractFactory("PriceConsumerV3");
    const price = PriceFeed.attach("0xb93804160EEBdBbb12E479067c82E27dc5801297");

    const getLatestPrice = await price.getLatestPrice();
    console.log("GET LATEST PRICE: ", Number(getLatestPrice._hex));

    const setFeedAddress = price.setFeedAddress("0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e");

    const getDynamicPriceFeed = await price.getLatestCoinPrice();
    console.log("Dynamic function feed", Number(getDynamicPriceFeed._hex));
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});