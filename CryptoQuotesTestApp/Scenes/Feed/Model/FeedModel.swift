import Foundation

struct FeedModel: Decodable {
    var data   : [CMCData]

    enum CodingKeys: String, CodingKey {
      case data   = "data"
    }
}

struct CMCData: Codable {
    var id                            : Int
    var name                          : String
    var symbol                        : String
    var slug                          : String?
    var maxSupply                     : Int?
    var quote                         : Quote?
    
    enum CodingKeys: String, CodingKey {
        case id                            = "id"
        case name                          = "name"
        case symbol                        = "symbol"
        case slug                          = "slug"
        case maxSupply                     = "max_supply"
        case quote                         = "quote"
    }
}

struct Quote: Codable {
    var USD : USD?
    
    enum CodingKeys: String, CodingKey {
        case USD = "USD"
    }
}

struct USD: Codable {
    var price                 : Double?
    var volume24h             : Double?
    var volumeChange24h       : Double?
    var percentChange1h       : Double?
    var percentChange24h      : Double?
    var percentChange7d       : Double?
    var percentChange30d      : Double?
    var percentChange60d      : Double?
    var percentChange90d      : Double?
    var marketCap             : Double?
    var marketCapDominance    : Double?
    var fullyDilutedMarketCap : Double?
    var lastUpdated           : String?
    
    enum CodingKeys: String, CodingKey {
        case price                 = "price"
        case volume24h             = "volume_24h"
        case volumeChange24h       = "volume_change_24h"
        case percentChange1h       = "percent_change_1h"
        case percentChange24h      = "percent_change_24h"
        case percentChange7d       = "percent_change_7d"
        case percentChange30d      = "percent_change_30d"
        case percentChange60d      = "percent_change_60d"
        case percentChange90d      = "percent_change_90d"
        case marketCap             = "market_cap"
        case marketCapDominance    = "market_cap_dominance"
        case fullyDilutedMarketCap = "fully_diluted_market_cap"
        case lastUpdated           = "last_updated"
    }
}
