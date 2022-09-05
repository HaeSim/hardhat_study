import "@nomiclabs/hardhat-ethers";
import "@nomiclabs/hardhat-waffle";
import { config, ethers } from "hardhat";
import { HttpNetworkUserConfig } from "hardhat/src/types/config";
import Caver from "caver-js";

async function main() {
  // network 셋팅 및 caver 연결
  const network = config.networks[
    process.env.HARDHAT_NETWORK as string
  ] as HttpNetworkUserConfig;

  const caver = new Caver(
    new Caver.providers.HttpProvider(network.url!, {
      headers: [{ name: "x-chain-id", value: network.chainId!.toString() }],
    })
  );

  // Keyring 생성 및 인메모리 지갑 등록
  const keyring = caver.wallet.keyring.createFromPrivateKey(
    process.env.PRIVATE_KEY!
  );
  caver.wallet.add(keyring);

  // 컨트랙트 불러오기
  const Token = await ethers.getContractFactory("Token");
  // Transaction 전송
  console.log("Deploying contracts with the account:", keyring.address);
  const contractInstance = new caver.contract(
    [
      {
        inputs: [],
        stateMutability: "nonpayable",
        type: "constructor",
      },
      {
        anonymous: false,
        inputs: [
          {
            indexed: true,
            internalType: "address",
            name: "_from",
            type: "address",
          },
          {
            indexed: true,
            internalType: "address",
            name: "_to",
            type: "address",
          },
          {
            indexed: false,
            internalType: "uint256",
            name: "_value",
            type: "uint256",
          },
        ],
        name: "Transfer",
        type: "event",
      },
      {
        inputs: [
          {
            internalType: "address",
            name: "account",
            type: "address",
          },
        ],
        name: "balanceOf",
        outputs: [
          {
            internalType: "uint256",
            name: "",
            type: "uint256",
          },
        ],
        stateMutability: "view",
        type: "function",
      },
      {
        inputs: [],
        name: "name",
        outputs: [
          {
            internalType: "string",
            name: "",
            type: "string",
          },
        ],
        stateMutability: "view",
        type: "function",
      },
      {
        inputs: [],
        name: "owner",
        outputs: [
          {
            internalType: "address",
            name: "",
            type: "address",
          },
        ],
        stateMutability: "view",
        type: "function",
      },
      {
        inputs: [],
        name: "symbol",
        outputs: [
          {
            internalType: "string",
            name: "",
            type: "string",
          },
        ],
        stateMutability: "view",
        type: "function",
      },
      {
        inputs: [],
        name: "totalSupply",
        outputs: [
          {
            internalType: "uint256",
            name: "",
            type: "uint256",
          },
        ],
        stateMutability: "view",
        type: "function",
      },
      {
        inputs: [
          {
            internalType: "address",
            name: "to",
            type: "address",
          },
          {
            internalType: "uint256",
            name: "amount",
            type: "uint256",
          },
        ],
        name: "transfer",
        outputs: [],
        stateMutability: "nonpayable",
        type: "function",
      },
    ],
    "0xe000891edd708466dacfd98ac3d4058fa799e714"
  );
  const result = await contractInstance.send(
    {
      from: keyring.address,
      gas: 50000000,
    },
    "transfer",
    "0x9810474715F389848B630085899FF03eAC8AC31a",
    10
  );
  console.log("result : ", result);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
