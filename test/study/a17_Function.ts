import { loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { expect } from "chai";
import { ethers } from "hardhat";

describe("Function Test", () => {
  const deployContractFixture = async () => {
    const Contract = await ethers.getContractFactory("Function");

    const myContract = await Contract.deploy();
    await myContract.deployed();

    return { myContract };
  };
  it("initialize", async () => {
    const { myContract } = await loadFixture(deployContractFixture);

    // test01. left value check
    expect(await myContract.destructuringAssignments()).to.lengthOf(5);
  });
});
