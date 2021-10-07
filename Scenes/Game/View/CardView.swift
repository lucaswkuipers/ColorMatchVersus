import UIKit

final class CardView: UIView {

    private let labelPadding: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 70, weight: .semibold)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()

    init() {
        super.init(frame: .zero)
        setupViewHierarchy()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func setupData(written text: String, in color: UIColor) {
        label.text = text
        label.textColor = color
    }

    private func setupViewHierarchy() {
        addSubview(labelPadding)
        labelPadding.addSubview(label)
    }

    private func setupConstraints() {
        labelPadding.prepareForConstraints()
//        labelPadding.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//        labelPadding.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        labelPadding.leftAnchor.constraint(greaterThanOrEqualTo: leftAnchor, constant: 20).isActive = true
//        labelPadding.rightAnchor.constraint(lessThanOrEqualTo: rightAnchor, constant: -20).isActive = true
        labelPadding.pinEdges(10)
        label.prepareForConstraints()
        label.pinEdges(20)
    }
}
