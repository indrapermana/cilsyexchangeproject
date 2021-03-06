pragma solidity ^0.5.0;

import "./Owned.sol";

contract CilsyExchange is Owned {

    // GENERAL STRUCTURES
    struct Offer {
        uint amount;
        address who;
    }

    struct OrderBook {
        uint higherPrice;
        uint lowerPrice;

        mapping (uint => Offer) offers;

        uint offers_key;
        uint offers_length;
    }

    struct Token {
        address tokenContract;
        string symbolName;

        mapping (uint => OrderBook) buyBook;
        uint curBuyPrice;
        uint lowerBuyPrice;
        uint amountBuyPrice;

        mapping (uint => OrderBook) sellBook;
        uint curSellPrice;
        uint lowerSellPrice;
        uint amountSellPrice;
    }


    // support a max of 255 tokens...
    mapping (uint8 => Token) tokens;
    uint8 symbolNameIndex;

    // BALANCES
    mapping (address => mapping (uint8 => uint)) tokenBalanceForAddress;
    mapping (address => uint) balanceEthForAddress;

    // EVENTS

    // DEPOSIT AND WITHDRAW ETHER
    function depositEther() public payable {
    }

    function withdrawEther(uint amountInWei) public {
    }

    function getEthBalanceInWei() public view returns (uint){
    }


    // TOKEN MANAGEMENT
    function addToken(string memory symbolName, address erc20TokenAddress) public onlyOwner {
        require(!hasToken(symbolName));
        symbolNameIndex++;
        tokens[symbolNameIndex].symbolName = symbolName;
        tokens[symbolNameIndex].tokenContract = erc20TokenAddress;
    }

    function hasToken(string memory symbolName) public view returns (bool) {
        uint8 index = getSymbolIndex(symbolName);
        if (index == 0) {
            return false;
        }
        return true;
    }


    function getSymbolIndex(string memory symbolName) public view returns (uint8) {
        for (uint8 i = 1; i <= symbolNameIndex; i++) {
            if (stringsEqual(tokens[i].symbolName, symbolName)) {
                return i;
            }
        }
        return 0;
    }
    
    function stringsEqual(string memory _a, string memory _b) internal pure returns (bool) {
        bytes memory a = bytes(_a);
        bytes memory b = bytes(_b);
        if (a.length != b.length) {
            return false;
        }

        for (uint i = 0; i < a.length; i++) {
            if (a[i] != b[i]) {
                return false;
            }
        }

        return true;
    }

    // DEPOSIT AND WITHDRAW TOKEN
    function depositToken(string memory symbolName, uint amount) public {
    }

    function withdrawToken(string memory symbolName, uint amount) public {
    }

    function getBalance(string memory symbolName) public view returns (uint) {
    }


    // ORDER BOOK - BID ORDERS
    function getBuyOrderBook(string memory symbolName) public view returns (uint[] memory, uint[] memory) {
    }

    // ORDER BOOK - ASK ORDERS
    function getSellOrderBook(string memory symbolName) public view returns (uint[] memory, uint[] memory) {
    }

    // NEW ORDER - BID
    function buyToken(string memory symbolName, uint priceInWei, uint amount) public {
    }

    // NEW ORDER - ASK
    function sellToken(string memory symbolName, uint priceInWei, uint amount) public {
    }

    // CANCEL LIMIT ORDER
    function cancelOrder(string memory symbolName, bool isSellOrder, uint priceInWei, uint offerKey) public {
    }

}