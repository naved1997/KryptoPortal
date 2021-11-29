
require('@nomiclabs/hardhat-waffle');

module.exports = {
  solidity: '0.8.0',
  networks: {
    ropsten: {
      url: 'https://eth-ropsten.alchemyapi.io/v2/kvl-xiY1IKjPkGZrHAA4l4a7TE0IC6ke',
      accounts: ['d4775e1ec7b24d30a2cf21552e7a21573cd27edc378bb911c945a3f49f5b9e2f'],
    },
  },
};
