import { loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { expect } from "chai";
import { ethers } from "hardhat";

describe("Inheritance Test", () => {
  const deployContractFixture = async () => {
    const Contract = await ethers.getContractFactory("F");
    const myContract = await Contract.deploy();
    await myContract.deployed();

    return { myContract };
  };
  it("initialize", async () => {
    const { myContract } = await loadFixture(deployContractFixture);

    // Event 1
    expect(await myContract.foo());
  });
});
