import { loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { expect } from "chai";
import { ethers } from "hardhat";

describe("Array Test", () => {
  const deployContractFixture = async () => {
    const ArrayContract = await ethers.getContractFactory("Array");
    const myArrayContract = await ArrayContract.deploy();
    await myArrayContract.deployed();

    const removeTestContract = await ethers.getContractFactory(
      "ArrayRemoveByShifting"
    );
    const myRemoveTestContract = await removeTestContract.deploy();
    await myRemoveTestContract.deployed();

    return { myArrayContract, myRemoveTestContract };
  };
  it("initialize", async () => {
    const { myArrayContract } = await loadFixture(deployContractFixture);

    // test01. initialize
    await expect(await myArrayContract.examples()).to.equal(0);
  });
  it("remove test", async () => {
    const { myRemoveTestContract } = await loadFixture(deployContractFixture);
    // test01. remove
    expect(await myRemoveTestContract.test()).to.have.any.keys("hash");
  });
});
