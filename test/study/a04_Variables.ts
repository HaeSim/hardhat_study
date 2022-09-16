import { loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { expect } from "chai";
import { ethers } from "hardhat";

describe("Variables Test", () => {
  const deployContractFixture = async () => {
    const Contract = await ethers.getContractFactory("Variables");

    const myContract = await Contract.deploy();
    await myContract.deployed();

    return { myContract };
  };
  it("initialize", async () => {
    const { myContract } = await loadFixture(deployContractFixture);

    // test01
    await expect(myContract.doSomething()).to.deep.equal([]);
  });
});
