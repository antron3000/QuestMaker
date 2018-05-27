module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // to customize your Truffle configuration!
  networks: {
    development: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*" // Match any network id
    },
    rinkeby: {
      host: "rinkeby.infura.io/mTHA4OGRiv9h9kJgTv7u",
      port: 80,
      network_id: "4",
      from: "0xE1B33AFb88C77E343ECbB9388829eEf6123a980a"
    }
  }
};
