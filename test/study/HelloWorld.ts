import { loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { expect } from "chai";
import { ethers } from "hardhat";

describe("Hello World Test..", () => {
  const deployContractFixture = async () => {
    const Contract = await ethers.getContractFactory("HelloWorld");

    const myContract = await Contract.deploy();

    await myContract.deployed();

    return { myContract };
  };

  it("run hello wolrd", async () => {
    const { myContract } = await loadFixture(deployContractFixture);

    expect(await myContract.greet()).to.equal("Hello World!");
  });
});
