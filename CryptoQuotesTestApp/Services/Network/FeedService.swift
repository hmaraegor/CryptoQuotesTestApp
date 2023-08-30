import Foundation

class FeedService: FeedProvider {
    
    private let apiKey = "8b994e69-9cbe-4c43-835d-3cecc9a1d5c9"
    
    private let queryItems: [URLQueryItem] = [
        URLQueryItem(name: "start", value: "1"),
        URLQueryItem(name: "limit", value: "500"),
        URLQueryItem(name: "convert", value: "USD")
    ]

    private let stringUrl = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?"
    let networkService: INetworkService

    init(networkService: INetworkService) {
        self.networkService = networkService
    }

    func getData(
        completionHandler: @escaping (Result<FeedModel, NetworkError>) -> ()
    ) {
        guard var components = URLComponents(string: stringUrl) else { return }
        components.queryItems = queryItems
        guard let url = components.url else { return }
        var request = URLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Accepts")
        request.setValue(apiKey, forHTTPHeaderField: "X-CMC_PRO_API_KEY")

        networkService.getData(request: request, completionHandler: completionHandler)
    }
}
