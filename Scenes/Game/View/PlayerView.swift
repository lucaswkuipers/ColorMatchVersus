import UIKit

protocol PlayerViewDelegate {
    func didPlayerAnswer(isTopPlayer: Bool, answer: String)
}

final class PlayerView: UIView {

    var delegate: PlayerViewDelegate?
    let isTopPlayer: Bool

    private let mainStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        return stack
    }()

    private let colorCardStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 20
        return stack
    }()

    private let writtenCardView = CardView()
    private let coloredCardView = CardView()

    private let answerOptionStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()

    private let yesAnswerButton = AnswerButton("YES")
    private let noAnswerButton = AnswerButton("NO")

    init(isTopPlayer: Bool = false) {
        self.isTopPlayer = isTopPlayer
        super.init(frame: .zero)

        setupView()
        setupViewHierarchy()
        setupConstraints()
        setupGestures()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    func setupData(writtenCardText: String,
                   writtenCardColor: UIColor,
                   coloredCardText: String,
                   coloredCardColor: UIColor) {
        writtenCardView.setupData(written: writtenCardText, in: writtenCardColor)
        coloredCardView.setupData(written: coloredCardText, in: coloredCardColor)
    }

    private func setupView() {
        if isTopPlayer {
            rotate(180)
        }

    }

    private func setupViewHierarchy() {
        addSubview(mainStackView)

        mainStackView.addArrangedSubview(colorCardStackView)
        mainStackView.addArrangedSubview(answerOptionStackView)

        colorCardStackView.addArrangedSubview(writtenCardView)
        colorCardStackView.addArrangedSubview(coloredCardView)

        answerOptionStackView.addArrangedSubview(yesAnswerButton)
        answerOptionStackView.addArrangedSubview(noAnswerButton)
    }

    private func setupConstraints() {
        mainStackView.prepareForConstraints()
        mainStackView.pinEdges(20)
    }

    private func setupGestures() {
        yesAnswerButton.addTarget(self, action: #selector(didTapYesAnswerButton), for: .touchUpInside)
        noAnswerButton.addTarget(self, action: #selector(didTapNoAnswerButton), for: .touchUpInside)
    }

    @objc private func didTapYesAnswerButton() {
        delegate?.didPlayerAnswer(isTopPlayer: isTopPlayer, answer: "YES")
    }

    @objc private func didTapNoAnswerButton() {
        delegate?.didPlayerAnswer(isTopPlayer: isTopPlayer, answer: "NO")
    }
}
