import { HardhatUserConfig } from 'hardhat/config';
import '@nomicfoundation/hardhat-toolbox';
import '@nomiclabs/hardhat-ethers';

const config: HardhatUserConfig = {
  solidity: {
    version: '0.8.13',
    settings: {
      evmVersion: 'istanbul',
    },
  },
  networks: {
    baobab: {
      url: 'https://kaikas.baobab.klaytn.net:8651',
      chainId: 1001,
      accounts: {
        initialIndex: 0,
        mnemonic: '', //privateKey
        accountsBalance: '100000000000000',
      },
    },
  },
};

export default config;
