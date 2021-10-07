import UIKit

final class BackgroundView: UIView {
    private let heightChangeAmount = 0.05
    private let half = 0.5
    private var topBackgroundHeightPercentage: CGFloat = 0.5
    private var topBackgroundHeightConstraint = NSLayoutConstraint()

    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        return stack
    }()

    private let topBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed
        return view
    }()

    private let bottomBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        return view
    }()

    init() {
        super.init(frame: .zero)
        setupViewHierarchy()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        updateHeights()
    }

    func increaseTopViewHeight() {
        topBackgroundHeightPercentage += heightChangeAmount

        if topBackgroundHeightPercentage >= 1 {
            resetHeights()
        } else {
            layoutSubviews()
        }
    }

    func decreaseTopViewHeight() {
        topBackgroundHeightPercentage -= heightChangeAmount

        if topBackgroundHeightPercentage <= 0 {
            resetHeights()
        } else {
            layoutSubviews()
        }
    }

    private func resetHeights() {
        SoundPlayer.shared.play(sound: .roundWon)
        topBackgroundHeightPercentage = half
        layoutSubviews()
    }

    private func setupViewHierarchy() {
        addSubview(stackView)

        stackView.addArrangedSubview(topBackgroundView)
        stackView.addArrangedSubview(bottomBackgroundView)
    }

    private func setupConstraints() {
        stackView.prepareForConstraints()
        stackView.pinEdges()
    }

    private func updateHeights() {
        topBackgroundHeightConstraint.isActive = false
        topBackgroundHeightConstraint = topBackgroundView.pinHeight(to: frame.height * topBackgroundHeightPercentage)
        topBackgroundHeightConstraint.isActive = true
    }
}
