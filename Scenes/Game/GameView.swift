import UIKit

final class GameView: UIView {

    var topPlayerBackgroundHeightConstraint = NSLayoutConstraint()

    // MARK: - Background

    private let playerBackgroundStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        return stack
    }()

    private let topPlayerBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed
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

    // MARK: - Top Player

    private let topPlayerStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        return stack
    }()

    private let topPlayerColorCardStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()

    // MARK: - Meaning

    private let topPlayerMeaningCardView = UIView()

    private let topPlayerMeaningCardLabelPadding: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()

    private let topPlayerMeaningCardLabel: UILabel = {
        let label = UILabel()
        label.text = "green"
        label.textColor = .magenta
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 70, weight: .semibold)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()

    // MARK: - Written

    private let topPlayerWrittenCardView = UIView()

    private let topPlayerWrittenCardLabelPadding: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()

    private let topPlayerWrittenCardLabel: UILabel = {
        let label = UILabel()
        label.text = "yellow"
        label.textColor = .blue
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 70, weight: .semibold)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()

    // MARK: - Options

    private let topPlayerAnswerOptionStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
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

    // MARK: - Bottom Player

    private let bottomPlayerStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        return stack
    }()

    private let bottomPlayerColorCardStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()

    // MARK: - Meaning

    private let bottomPlayerMeaningCardView = UIView()

    private let bottomPlayerMeaningCardLabelPadding: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()

    private let bottomPlayerMeaningCardLabel: UILabel = {
        let label = UILabel()
        label.text = "blue"
        label.textColor = .magenta
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 70, weight: .semibold)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()

    // MARK: - Written

    private let bottomPlayerWrittenCardView = UIView()

    private let bottomPlayerWrittenCardLabelPadding: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()

    private let bottomPlayerWrittenCardLabel: UILabel = {
        let label = UILabel()
        label.text = "red"
        label.textColor = .blue
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 70, weight: .semibold)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()

    // MARK: - Options

    private let bottomPlayerAnswerOptionStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()

    private let bottomPlayerYesAnswerButton: UIButton = {
        let button = UIButton()
        button.setTitle("YES", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 50, weight: .medium)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        return button
    }()

    private let bottomPlayerNoAnswerButton: UIButton = {
        let button = UIButton()
        button.setTitle("NO", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 50, weight: .medium)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        return button
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
        topPlayerStackView.rotate(180)
    }

    func addSubviews() {

        // MARK: - Background

        addSubview(playerBackgroundStackView)

        playerBackgroundStackView.addArrangedSubview(topPlayerBackgroundView)
        playerBackgroundStackView.addArrangedSubview(bottomPlayerBackgroundView)

        // MARK: - Interactable

        addSubview(playerStackView)

        playerStackView.addArrangedSubview(topPlayerStackView)
        playerStackView.addArrangedSubview(bottomPlayerStackView)

        // MARK: - Top Player

        topPlayerStackView.addArrangedSubview(topPlayerColorCardStackView)
        topPlayerStackView.addArrangedSubview(topPlayerAnswerOptionStackView)

        // MARK: - Meaning

        topPlayerColorCardStackView.addArrangedSubview(topPlayerMeaningCardView)

        topPlayerMeaningCardView.addSubview(topPlayerMeaningCardLabelPadding)
        topPlayerMeaningCardLabelPadding.addSubview(topPlayerMeaningCardLabel)

        // MARK: - Written

        topPlayerColorCardStackView.addArrangedSubview(topPlayerWrittenCardView)

        topPlayerWrittenCardView.addSubview(topPlayerWrittenCardLabelPadding)
        topPlayerWrittenCardLabelPadding.addSubview(topPlayerWrittenCardLabel)

        // MARK: - Options

        topPlayerAnswerOptionStackView.addArrangedSubview(topPlayerYesAnswerButton)
        topPlayerAnswerOptionStackView.addArrangedSubview(topPlayerNoAnswerButton)

        // MARK: - Bottom Player

        bottomPlayerStackView.addArrangedSubview(bottomPlayerColorCardStackView)
        bottomPlayerStackView.addArrangedSubview(bottomPlayerAnswerOptionStackView)

        // MARK: - Meaning

        bottomPlayerColorCardStackView.addArrangedSubview(bottomPlayerMeaningCardView)

        bottomPlayerMeaningCardView.addSubview(bottomPlayerMeaningCardLabelPadding)
        bottomPlayerMeaningCardLabelPadding.addSubview(bottomPlayerMeaningCardLabel)

        // MARK: - Written

        bottomPlayerColorCardStackView.addArrangedSubview(bottomPlayerWrittenCardView)

        bottomPlayerWrittenCardView.addSubview(bottomPlayerWrittenCardLabelPadding)
        bottomPlayerWrittenCardLabelPadding.addSubview(bottomPlayerWrittenCardLabel)

        // MARK: - Options

        bottomPlayerAnswerOptionStackView.addArrangedSubview(bottomPlayerYesAnswerButton)
        bottomPlayerAnswerOptionStackView.addArrangedSubview(bottomPlayerNoAnswerButton)
    }

    func setupConstraints() {

        // MARK: - Background

        playerBackgroundStackView.prepareForConstraints()
        playerBackgroundStackView.pinEdges()

        // MARK: - Interactable

        playerStackView.prepareForConstraints()
        playerStackView.pinEdges()

        // MARK: - Top Player

        // MARK: - Meaning

        topPlayerMeaningCardLabelPadding.prepareForConstraints()
        topPlayerMeaningCardLabelPadding.centerXAnchor.constraint(equalTo: topPlayerMeaningCardView.centerXAnchor).isActive = true
        topPlayerMeaningCardLabelPadding.centerYAnchor.constraint(equalTo: topPlayerMeaningCardView.centerYAnchor).isActive = true
        topPlayerMeaningCardLabelPadding.leftAnchor.constraint(greaterThanOrEqualTo: topPlayerMeaningCardView.leftAnchor, constant: 20).isActive = true
        topPlayerMeaningCardLabelPadding.rightAnchor.constraint(lessThanOrEqualTo: topPlayerMeaningCardView.rightAnchor, constant: -20).isActive = true
        topPlayerMeaningCardLabel.prepareForConstraints()
        topPlayerMeaningCardLabel.pinEdges(10)

        // MARK: - Written

        topPlayerWrittenCardLabelPadding.prepareForConstraints()
        topPlayerWrittenCardLabelPadding.centerXAnchor.constraint(equalTo: topPlayerWrittenCardView.centerXAnchor).isActive = true
        topPlayerWrittenCardLabelPadding.centerYAnchor.constraint(equalTo: topPlayerWrittenCardView.centerYAnchor).isActive = true
        topPlayerWrittenCardLabelPadding.leftAnchor.constraint(greaterThanOrEqualTo: topPlayerWrittenCardView.leftAnchor, constant: 20).isActive = true
        topPlayerWrittenCardLabelPadding.rightAnchor.constraint(lessThanOrEqualToSystemSpacingAfter: topPlayerWrittenCardView.rightAnchor, multiplier: -20).isActive = true
        topPlayerWrittenCardLabel.prepareForConstraints()
        topPlayerWrittenCardLabel.pinEdges(10)

        // MARK: - Bottom Player

        // MARK: - Meaning

        bottomPlayerMeaningCardLabelPadding.prepareForConstraints()
        bottomPlayerMeaningCardLabelPadding.centerXAnchor.constraint(equalTo: bottomPlayerMeaningCardView.centerXAnchor).isActive = true
        bottomPlayerMeaningCardLabelPadding.centerYAnchor.constraint(equalTo: bottomPlayerMeaningCardView.centerYAnchor).isActive = true
        bottomPlayerMeaningCardLabelPadding.leftAnchor.constraint(greaterThanOrEqualTo: bottomPlayerMeaningCardView.leftAnchor, constant: 20).isActive = true
        bottomPlayerMeaningCardLabelPadding.rightAnchor.constraint(lessThanOrEqualTo: bottomPlayerMeaningCardView.rightAnchor, constant: -20).isActive = true
        bottomPlayerMeaningCardLabel.prepareForConstraints()
        bottomPlayerMeaningCardLabel.pinEdges(10)

        // MARK: - Written

        bottomPlayerWrittenCardLabelPadding.prepareForConstraints()
        bottomPlayerWrittenCardLabelPadding.centerXAnchor.constraint(equalTo: bottomPlayerWrittenCardView.centerXAnchor).isActive = true
        bottomPlayerWrittenCardLabelPadding.centerYAnchor.constraint(equalTo: bottomPlayerWrittenCardView.centerYAnchor).isActive = true
        bottomPlayerWrittenCardLabelPadding.leftAnchor.constraint(greaterThanOrEqualTo: bottomPlayerMeaningCardView.leftAnchor, constant: 20).isActive = true
        bottomPlayerWrittenCardLabelPadding.rightAnchor.constraint(lessThanOrEqualTo: bottomPlayerWrittenCardView.rightAnchor, constant: -20).isActive = true
        bottomPlayerWrittenCardLabel.prepareForConstraints()
        bottomPlayerWrittenCardLabel.pinEdges(10)

    }

    override func layoutSubviews() {
        super.layoutSubviews()
        topPlayerBackgroundHeightConstraint = topPlayerBackgroundView.pinHeight(to: frame.height / 2)
    }
}
