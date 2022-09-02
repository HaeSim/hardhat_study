import { loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { expect } from "chai";
import { ethers } from "hardhat";

describe("Counter Test", () => {
  const deployContractFixture = async () => {
    const Contract = await ethers.getContractFactory("Counter");

    const myContract = await Contract.deploy();
    await myContract.deployed();

    return { myContract };
  };
  it("initialize", async () => {
    const { myContract } = await loadFixture(deployContractFixture);

    // test01. initail state is 0
    expect(await myContract.get()).to.equal(0);
  });

  it("increase", async () => {
    const { myContract } = await loadFixture(deployContractFixture);

    await myContract.inc();

    expect(await myContract.get()).to.equal(1);
  });

  it("decrease", async () => {
    const { myContract } = await loadFixture(deployContractFixture);

    await myContract.inc();
    await myContract.inc();
    await myContract.inc();
    await myContract.dec();

    expect(await myContract.get()).to.equal(2);
  });
});
