import UIKit

class FeedCell: UITableViewCell {

    // MARK: - UI Components

    lazy var label: UILabel = {
        let view = UILabel()
        view.font = UIFont.boldSystemFont(ofSize: 20)
        view.textColor = .secondaryLabel
        return view
    }()

    // MARK: - Properties

    static let identifier = String(describing: FeedCell.self)

    // MARK: - Setup views

    func configure(
        with coinData: CMCData,
        completion: @escaping (Int) -> Bool
    ) {
        label.text = coinData.name
        setupViews()
    }

    private func setupViews() {
        setupSubviews()
        setupConstraints()
    }

    private func setupSubviews(){
        contentView.addSubviews(label)
    }

    private func setupConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
