import UIKit

protocol GameViewDelegate: AnyObject {
    func didTopPlayerAnswer(_ isAnswerYes: Bool)
    func didBottomPlayerAnswer(_ isAnswerYes: Bool)
}

final class GameView: UIView {

    weak var delegate: GameViewDelegate?

    private let backgroundView = BackgroundView()
    private let topPlayerView = PlayerView(isTopPlayer: true)
    private let bottomPlayerView = PlayerView()

    private let playerStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        return stack
    }()

    init() {
        super.init(frame: .zero)
        setupViewHierarchy()
        setupConstraints()

        topPlayerView.delegate = self
        bottomPlayerView.delegate = self
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func setupTopPlayerData(topPlayerWrittenCardText: String,
                            topPlayerWrittenCardColor: UIColor,
                            topPlayerColoredCardText: String,
                            topPlayerColoredCardColor: UIColor) {
        topPlayerView.setupData(writtenCardText: topPlayerWrittenCardText,
                                writtenCardColor: topPlayerWrittenCardColor,
                                coloredCardText: topPlayerColoredCardText,
                                coloredCardColor: topPlayerColoredCardColor)
    }

    func setupBottomPlayerData(bottomPlayerWrittenCardText: String,
                               bottomPlayerWrittenCardColor: UIColor,
                               bottomPlayerColoredCardText: String,
                               bottomPlayerColoredCardColor: UIColor) {
        bottomPlayerView.setupData(writtenCardText: bottomPlayerWrittenCardText,
                                   writtenCardColor: bottomPlayerWrittenCardColor,
                                   coloredCardText: bottomPlayerColoredCardText,
                                   coloredCardColor: bottomPlayerColoredCardColor)
    }

    func increaseBackgroundTopViewHeight() {
        backgroundView.increaseTopViewHeight()
    }

    func increaseBackgroundBottomViewHeight() {
        backgroundView.decreaseTopViewHeight()
    }

    private func setupViewHierarchy() {
        addSubview(backgroundView)
        addSubview(playerStackView)

        playerStackView.addArrangedSubview(topPlayerView)
        playerStackView.addArrangedSubview(bottomPlayerView)
    }

    private func setupConstraints() {
        backgroundView.prepareForConstraints()
        backgroundView.pinEdges()

        playerStackView.prepareForConstraints()
        playerStackView.pinEdges()
    }
}

extension GameView: PlayerViewDelegate {
    func didPlayerAnswer(isTopPlayer: Bool, isAnswerYes: Bool) {
        if isTopPlayer {
            delegate?.didTopPlayerAnswer(isAnswerYes)
        } else {
            delegate?.didBottomPlayerAnswer(isAnswerYes)
        }
    }
}
