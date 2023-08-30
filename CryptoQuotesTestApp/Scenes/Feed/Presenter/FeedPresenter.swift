import UIKit

protocol FeedPresenterDelegate: AnyObject {
    func presentCoins(coins: [CMCData])
    func presentAlert(error: NetworkError)
}

typealias PressenterDelegate = FeedPresenterDelegate & UIViewController

protocol FeedPresenterProtocol: AnyObject {
    func didTapCoin(coinData: CMCData)
    func getCoins()
}

class FeedPresenter: FeedPresenterProtocol {

    weak var delegate: PressenterDelegate?
    private var feedService: FeedProvider
    private var coins: [CMCData] = []

    init(feedService: FeedProvider) {
        self.feedService = feedService
    }

    public func getCoins() {
        feedService.getData { [weak self] (result: Result<FeedModel, NetworkError>) in
            guard let self = self else { return }
            switch result {
            case .success(let feedModel):
                self.coins = feedModel.data
                self.delegate?.presentCoins(coins: self.coins)
            case .failure(let error):
                self.delegate?.presentAlert(error: error)
            }
        }
    }

    public func didTapCoin(coinData: CMCData) {
        let viewController = ViewControllerFactory.makeCoinViewController(coinData: coinData)
        delegate?.navigationController?.pushViewController(viewController, animated: true)
    }

}
