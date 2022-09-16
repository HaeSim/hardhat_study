import { loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { expect } from "chai";
import { ethers } from "hardhat";

describe("ShadowingInheritedStateVariables Test", () => {
  const deployContractFixture = async () => {
    const Contract = await ethers.getContractFactory("DDD");
    const myContract = await Contract.deploy();
    await myContract.deployed();

    return { myContract };
  };
  it("initialize", async () => {
    const { myContract } = await loadFixture(deployContractFixture);
    // Event 1
    await expect(myContract.foo())
      .to.emit(myContract, "Log")
      .withArgs("C.foo called");

    await expect(myContract.bar())
      .to.emit(myContract, "Log")
      .withArgs("C.bar called");
  });
});
