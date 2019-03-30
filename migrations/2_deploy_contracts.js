const CilsyExchange = artifacts.require("CilsyExchange");
const FixedSupplyToken = artifacts.require("FixedSupplyToken");

module.exports = function (deployer) {
    deployer.deploy(CilsyExchange);
    deployer.deploy(FixedSupplyToken);
};