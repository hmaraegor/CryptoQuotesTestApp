import UIKit

protocol ICoinView: UIView {
    var coinImage: UIImageView { get }
}

class CoinView: UIView, ICoinView {
    
    // MARK: - UI Components

    lazy var coinImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "coloncurrencysign.circle")
        view.backgroundColor = UIColor.random
        view.contentMode = .scaleAspectFill
        return view
    }()

    private lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.boldSystemFont(ofSize: 20)
        view.textColor = .systemBrown
        view.numberOfLines = 0
        return view
    }()
    
    private lazy var infoLabel: UILabel = {
        let view = UILabel()
        view.textColor = .systemGray
        view.numberOfLines = 0
        return view
    }()
    
    private lazy var lastUpdatedLabel: UILabel = {
        let view = UILabel()
        view.textColor = .systemGreen
        view.textAlignment = .right
        view.numberOfLines = 0
        return view
    }()

    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        return view
    }()

    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 10
        return view
    }()

    // MARK: - Properties

    private let name: String
    private let info: String
    private let lastUpdated: String
    private var screenWidth = CGFloat(UIScreen.width)

    required init(name: String, info: String, lastUpdated: String) {
        self.name = name
        self.info = info
        self.lastUpdated = lastUpdated
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        backgroundColor = .white
        nameLabel.text = name
        infoLabel.text = info
        lastUpdatedLabel.text = "updated: " + Date.getTimeStampFrom(stringDate: lastUpdated)
        setupSubviews()
        setupConstraints()
    }
    

    private func setupSubviews() {
        addSubviews(scrollView)
        scrollView.addSubviews(stackView)
        let stackSubviews = [
            coinImage,
            lastUpdatedLabel,
            nameLabel,
            infoLabel
        ]
        stackView.addArrangedSubviews(stackSubviews)
    }

    private func setupConstraints() {

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        coinImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            coinImage.topAnchor.constraint(equalTo: stackView.topAnchor),
            coinImage.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            coinImage.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            coinImage.heightAnchor.constraint(equalToConstant: screenWidth),
            coinImage.widthAnchor.constraint(equalToConstant: screenWidth)
        ])
        
        lastUpdatedLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lastUpdatedLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -20)
        ])
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -20),
            nameLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 20)
        ])
        
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -20),
            infoLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 20)
        ])

        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
}
