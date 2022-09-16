import { loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { expect } from "chai";
import { ethers } from "hardhat";

describe("ShadowingInheritedStateVariables Test", () => {
  const deployContractFixture = async () => {
    const Contract = await ethers.getContractFactory("CC");
    const myContract = await Contract.deploy();
    await myContract.deployed();

    return { myContract };
  };
  it("initialize", async () => {
    const { myContract } = await loadFixture(deployContractFixture);
    console.log(await myContract.setName("hi"));
    console.log(await myContract.name());
    // Event 1
    expect(await myContract.name());
  });
});
