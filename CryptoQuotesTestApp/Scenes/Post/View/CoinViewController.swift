import UIKit

class CoinViewController: UIViewController {

    // MARK: - Properties

    private let mainView: ICoinView
    private let coinData: CMCData

    // MARK: - Life cycle

    init(coinData: CMCData, coinView: ICoinView) {
        self.mainView = coinView
        self.coinData = coinData
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

