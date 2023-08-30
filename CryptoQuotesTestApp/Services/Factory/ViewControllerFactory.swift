import UIKit

protocol Factory {
    static func makeFeedViewController() -> UIViewController
    static func makeCoinViewController(coinData: CMCData) -> UIViewController
}

enum ViewControllerFactory: Factory {
    static func makeFeedViewController() -> UIViewController {
        let networkService = NetworkService.shared
        let feedProvider = FeedService(networkService: networkService)
        let presenter = FeedPresenter(feedService: feedProvider)
        let viewController = FeedViewController(presenter: presenter)
        presenter.delegate = viewController
        return viewController
    }

    static func makeCoinViewController(coinData: CMCData) -> UIViewController {
        let view: ICoinView = ViewFactory.makeCoinView(coinData: coinData)
        let viewController = CoinViewController(coinData: coinData, coinView: view)
        return viewController
    }
}
