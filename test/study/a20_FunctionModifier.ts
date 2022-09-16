import { loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { expect } from "chai";
import { ethers } from "hardhat";

describe("FunctionModifier Test", () => {
  const deployContractFixture = async () => {
    const Contract = await ethers.getContractFactory("FunctionModifier");

    const myContract = await Contract.deploy();
    await myContract.deployed();

    return { myContract };
  };
  it("initialize", async () => {
    const { myContract } = await loadFixture(deployContractFixture);

    // test
    await expect(myContract.decrement(10)).to.be.rejectedWith("reentrancy");
  });
});
