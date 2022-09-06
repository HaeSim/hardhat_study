import { loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { expect } from "chai";
import { ethers } from "hardhat";

describe("NestedMapping Test", () => {
  const deployContractFixture = async () => {
    const Contract = await ethers.getContractFactory("NestedMapping");
    const [deployer] = await ethers.getSigners();
    const myContract = await Contract.deploy();
    await myContract.deployed();

    return { myContract, deployer };
  };
  it("initialize", async () => {
    const { myContract, deployer } = await loadFixture(deployContractFixture);

    // test01. initialize
    expect(await myContract.get(deployer.address, 1)).to.equal(false);
  });
  it("set", async () => {
    const { myContract, deployer } = await loadFixture(deployContractFixture);
    await myContract.set(deployer.address, 1, true);
    // test01. set value
    expect(await myContract.get(deployer.address, 1)).to.equal(true);
  });
});
