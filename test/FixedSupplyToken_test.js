const FixedSupplyToken = artifacts.require("FixedSupplyToken");

contract('FixedSupplyToken', function (accounts) {
    var myTokenInstance;

    it("Balance account one should be same with total supply", function () {
        var _totalSupply;
        return FixedSupplyToken.deployed().then(function (instance) {
            myTokenInstance = instance;
            return myTokenInstance.totalSupply.call();
        }).then(function (totalSupply) {
            _totalSupply = totalSupply;
            return myTokenInstance.balanceOf(accounts[0]);
        }).then(function (balanceAccountOwner) {
            assert.equal(balanceAccountOwner.toNumber(), _totalSupply.toNumber(), "Total amount of tokens is owned by owner");
        });
    });

    it("second account should own no tokens", function () {
        return FixedSupplyToken.deployed().then(function (instance) {
            myTokenInstance = instance;
            return myTokenInstance.balanceOf(accounts[1]);
        }).then(function (balanceAccountOwner) {
            assert.equal(balanceAccountOwner.toNumber(), 0, "Total Amount of tokens is owned by some other address");
        });
    });

    it("transfer from account[0] to account[1]", function () {
        return FixedSupplyToken.deployed().then(function (instance) {
            myTokenInstance = instance;
            // your code

        });
    });
});