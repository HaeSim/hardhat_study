import { loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { expect } from "chai";
import { ethers } from "hardhat";

describe("Enum Test", () => {
  const deployContractFixture = async () => {
    const Contract = await ethers.getContractFactory("Enum");

    const myContract = await Contract.deploy();
    await myContract.deployed();

    return { myContract };
  };
  it("initialize", async () => {
    const { myContract } = await loadFixture(deployContractFixture);

    // test01. initial state
    expect(await myContract.get()).to.equal(0);
  });
  it("set Accepted", async () => {
    const { myContract } = await loadFixture(deployContractFixture);

    myContract.cancel();

    // test02. set state to
    expect(await myContract.get()).to.equal(4);
  });
});
