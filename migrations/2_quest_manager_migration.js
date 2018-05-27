var QuestManager = artifacts.require("./QuestManager.sol");

module.exports = function(deployer) {
  deployer.deploy(QuestManager);
};
