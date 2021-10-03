import UIKit

final class GameView: UIView {

    var topPlayerHeightConstraint = NSLayoutConstraint()

    // MARK: - Background

    private let playerBackgroundStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        return stack
    }()

    private let topPlayerBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        return view
    }()

    private let bottomPlayerBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        return view
    }()

    // MARK: - Interactable

    private let playerStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        return stack
    }()

    private let topPlayerStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        return stack
    }()

    private let topPlayerColorStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()

    private let topPlayerColorMeaningLabel: UILabel = {
        let label = UILabel()
        label.text = "blue"
        label.textColor = .magenta
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 50, weight: .semibold)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()

    private let topPlayerColorWrittenLabel: UILabel = {
        let label = UILabel()
        label.text = "red"
        label.textColor = .blue
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 50, weight: .semibold)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()

    private let topPlayerYesAnswerButton: UIButton = {
        let button = UIButton()
        button.setTitle("YES", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 50, weight: .medium)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        return button
    }()

    private let topPlayerNoAnswerButton: UIButton = {
        let button = UIButton()
        button.setTitle("NO", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 50, weight: .medium)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        return button
    }()

    private let topPlayerAnswerOptionStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()

    private let bottomPlayerStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        return stack
    }()

    // MARK: - View Cycle

    init() {
        super.init(frame: .zero)
        setupSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}

// MARK: - Setup Subviews

extension GameView {

    func setupSubviews() {
        addSubviews()
        setupConstraints()
    }

    func addSubviews() {
        addSubview(playerBackgroundStackView)
        playerBackgroundStackView.addArrangedSubview(topPlayerBackgroundView)
        playerBackgroundStackView.addArrangedSubview(bottomPlayerBackgroundView)

        addSubview(playerStackView)
        playerStackView.addArrangedSubview(topPlayerStackView)
        playerStackView.addArrangedSubview(bottomPlayerStackView)
        topPlayerStackView.addArrangedSubview(topPlayerColorStackView)
        topPlayerStackView.addArrangedSubview(topPlayerAnswerOptionStackView)
        topPlayerColorStackView.addArrangedSubview(topPlayerColorMeaningLabel)
        topPlayerColorStackView.addArrangedSubview(topPlayerColorWrittenLabel)
        topPlayerAnswerOptionStackView.addArrangedSubview(topPlayerYesAnswerButton)
        topPlayerAnswerOptionStackView.addArrangedSubview(topPlayerNoAnswerButton)
    }

    func setupConstraints() {
        playerBackgroundStackView.prepareForConstraints()
        playerBackgroundStackView.pinEdges()

        playerStackView.prepareForConstraints()
        playerStackView.pinEdges()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        topPlayerHeightConstraint = topPlayerBackgroundView.pinHeight(to: frame.height / 2)
    }
}
