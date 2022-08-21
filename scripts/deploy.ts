import { ethers } from "hardhat";

async function main() {
  const Price = await ethers.getContractFactory("PriceConsumerV3");
  const price = await Price.deploy();
  await price.deployed();

  console.log("Price feed contract deployed at: ", price.address);
  
  // const getLatestPrice = await price.getLatestPrice();
  // console.log("GET LATEST PRICE: ", Number(getLatestPrice._hex));

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});