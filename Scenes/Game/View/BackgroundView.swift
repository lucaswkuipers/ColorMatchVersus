import UIKit

final class BackgroundView: UIView {
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

    func increaseTopViewHeight(by amount: CGFloat = 0.03) {
        topBackgroundHeightPercentage += amount

        if topBackgroundHeightPercentage >= 1 {
            SoundPlayer.shared.play(sound: .roundWon)
            resetHeights()
        } else {
            layoutSubviews()
        }
    }

    func decreaseTopViewHeight(by amount: CGFloat = 0.03) {
        topBackgroundHeightPercentage -= amount

        if topBackgroundHeightPercentage <= 0 {
            SoundPlayer.shared.play(sound: .roundWon)
            resetHeights()
        } else {
            layoutSubviews()
        }
    }

    private func resetHeights() {
        topBackgroundHeightPercentage = 0.5
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
