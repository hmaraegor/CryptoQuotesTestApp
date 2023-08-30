import UIKit

//MARK: - Presenter Delegate

extension FeedViewController: FeedPresenterDelegate {

    func presentCoins(coins: [CMCData]) {
        self.coins = coins
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }

    func presentAlert(error: NetworkError) {
        ErrorAlertService.showErrorAlert(error: error) { [weak self] alert in
            self?.present(alert, animated: true, completion: nil)
        }
    }
}

//MARK: - ViewController

class FeedViewController: UITableViewController {

    //MARK: - Properties

    private let presenter: FeedPresenterProtocol

    private let screenWidth = UIScreen.width
    private var coins = [CMCData]()

    //MARK: - View Cycle

    init(presenter: FeedPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(FeedCell.self, forCellReuseIdentifier: FeedCell.identifier)
        setupView()
        presenter.getCoins()
    }

    //MARK: - Setup View

    private func setupView() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: nil)
        self.title = "Crypto currencies"
    }
}

//MARK: - TableViewDataSource

extension FeedViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coins.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: FeedCell.identifier, for: indexPath)
        guard let feelCell = cell as? FeedCell else { return cell }


        feelCell.tag = indexPath.row
        let content = coins[indexPath.row]
        feelCell.configure(
            with: content
        ) { theTag in
            return theTag == indexPath.row
        }

        return feelCell
    }
}

//MARK: - TableViewDetegate

extension FeedViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didTapCoin(coinData: coins[indexPath.row])
    }
}
