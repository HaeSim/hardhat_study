import { loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { expect } from "chai";
import { ethers } from "hardhat";

describe("Event Test", () => {
  const deployContractFixture = async () => {
    const Contract = await ethers.getContractFactory("Event");
    const [deployer] = await ethers.getSigners();
    const myContract = await Contract.deploy();
    await myContract.deployed();

    return { myContract, deployer };
  };
  it("initialize", async () => {
    const { myContract, deployer } = await loadFixture(deployContractFixture);

    // Event 1
    await expect(myContract.test())
      .to.emit(myContract, "Log")
      .withArgs(deployer.address, "Hello World!");

    // Event 2
    await expect(myContract.test())
      .to.emit(myContract, "Log")
      .withArgs(deployer.address, "Hello EVM!");

    // Event 3
    await expect(myContract.test()).to.emit(myContract, "AnotherLog");
  });
});
