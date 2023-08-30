import UIKit

enum ViewFactory {
    static func makeCoinView(coinData: CMCData) -> ICoinView {
        return CoinView(
            name: coinData.name,
            info: makeInfoText(coin: coinData),
            lastUpdated: coinData.quote?.USD?.lastUpdated ?? "-")
    }
    
    static func makeInfoText(coin: CMCData) -> String {
        
        var string = ""
        string = string + "Price: " + String(describing: (coin.quote?.USD?.price ?? 0)) + " USD" + "\n"
        string = string + "CoinID: " + String(coin.id) + "\n"
        string = string + "Symbol: " + coin.symbol + "\n"
        string = string + "Supply: " + (coin.maxSupply != nil ? "\(coin.maxSupply!)" : "N/A") + "\n"
        if let marketCap = coin.quote?.USD?.marketCap {
            string = string + "Market Cap: " + (String(describing: marketCap)) + "\n"
        }
        if let percentChange = coin.quote?.USD?.percentChange24h {
            string = string + "Percent Change 24h: " + (String(describing: percentChange)) + "\n"
        }
        
        return string
    }
}
