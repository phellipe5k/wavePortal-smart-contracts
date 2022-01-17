require("@nomiclabs/hardhat-waffle");
const dotenv = require('dotenv');
dotenv.config();
module.exports = {
  solidity: "0.8.4",
  networks: {
    rinkeby: {
      url: `${process.env.ALCHEMY_API_URL}`,
      accounts: [`${process.env.WALLET_PRIVATE_KEY}`],
    },
  },
};