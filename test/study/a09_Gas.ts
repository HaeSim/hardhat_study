import { loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { expect } from "chai";
import { ethers } from "hardhat";

describe("Gas Test", () => {
  const deployContractFixture = async () => {
    const Contract = await ethers.getContractFactory("Gas");

    const myContract = await Contract.deploy();
    await myContract.deployed();

    return { myContract };
  };
  it("initialize", async () => {
    const { myContract } = await loadFixture(deployContractFixture);

    // test01. gas fee error
    await expect(myContract.forever()).to.be.revertedWithoutReason();
  });
});
