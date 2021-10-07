import LogicKit

final class GameViewAdapter {
    let soundManager = SoundPlayer.shared
    let colorsDictionary: ColorDictionary = ["red": .systemRed,
                                             "green": .systemGreen,
                                             "blue": .systemBlue]

    var view: GameView?
    var questionGenerator = QuestionGenerator()
    var topPlayerQuestion: Question?
    var bottomPlayerQuestion: Question?

    private func generateQuestions() {
        generateTopPlayerQuestion()
        generateBottomPlayerQuestion()
    }

    private func generateTopPlayerQuestion() {
        let colors = Colors(from: colorsDictionary)
        topPlayerQuestion = questionGenerator.generateQuestion(from: colors)
    }

    private func generateBottomPlayerQuestion() {
        let colors = Colors(from: colorsDictionary)
        bottomPlayerQuestion = questionGenerator.generateQuestion(from: colors)
    }

    private func setQuestionsToView() {
        setQuestionToTopPlayerView()
        setQuestionToBottomPlayerView()
    }

    private func setQuestionToTopPlayerView() {
        guard let view = view else { return }

        guard let topPlayerWrittenCardText = topPlayerQuestion?.writtenPair.text else { return }
        guard let topPlayerWrittenCardColor = topPlayerQuestion?.writtenPair.color else { return }
        guard let topPlayerColoredCardText = topPlayerQuestion?.meaningPair.text else { return }
        guard let topPlayerColoredCardColor = topPlayerQuestion?.meaningPair.color else { return }

        view.setupTopPlayerData(topPlayerWrittenCardText: topPlayerWrittenCardText,
                        topPlayerWrittenCardColor: topPlayerWrittenCardColor,
                        topPlayerColoredCardText: topPlayerColoredCardText,
                        topPlayerColoredCardColor: topPlayerColoredCardColor)
    }

    private func setQuestionToBottomPlayerView() {
        guard let view = view else { return }

        guard let bottomPlayerWrittenCardText = bottomPlayerQuestion?.writtenPair.text else { return }
        guard let bottomPlayerWrittenCardColor = bottomPlayerQuestion?.writtenPair.color else { return }
        guard let bottomPlayerColoredCardText = bottomPlayerQuestion?.meaningPair.text else { return }
        guard let bottomPlayerColoredCardColor = bottomPlayerQuestion?.meaningPair.color else { return }

        view.setupBottomPlayerData(bottomPlayerWrittenCardText: bottomPlayerWrittenCardText,
                                   bottomPlayerWrittenCardColor: bottomPlayerWrittenCardColor,
                                   bottomPlayerColoredCardText: bottomPlayerColoredCardText,
                                   bottomPlayerColoredCardColor: bottomPlayerColoredCardColor)
    }


    private func evaluateTopPlayerAnswer(_ isPlayerAnswerYes: Bool) {
        guard let isCorrectAnswerYes = topPlayerQuestion?.isAnswerYes else { return }

        if isPlayerAnswerYes == isCorrectAnswerYes {
            didTopPlayerAnswerCorrectly()
        } else {
            didTopPlayerAnswerIncorrectly()
        }
    }

    private func didTopPlayerAnswerCorrectly() {
        soundManager.play(sound: .topPlayerCorrectAnswer)
        view?.increaseBackgroundTopViewHeight()
    }

    private func didTopPlayerAnswerIncorrectly() {
        soundManager.play(sound: .topPlayerIncorrectAnswer)
        view?.increaseBackgroundBottomViewHeight()
    }

    private func evaluateBottomPlayerAnswer(_ isPlayerAnswerYes: Bool) {
        guard let isCorrectAnswerYes = bottomPlayerQuestion?.isAnswerYes else { return }

        if isPlayerAnswerYes == isCorrectAnswerYes {
            didBottomPlayerAnswerCorrectly()
        } else {
            didBottomPlayerAnswerIncorrectly()
        }
    }

    private func didBottomPlayerAnswerCorrectly() {
        soundManager.play(sound: .bottomPlayerCorrectAnswer)
        view?.increaseBackgroundBottomViewHeight()
    }

    private func didBottomPlayerAnswerIncorrectly() {
        soundManager.play(sound: .bottomPlayerIncorrectAnswer)
        view?.increaseBackgroundTopViewHeight()
    }
}

extension GameViewAdapter: GameViewControllerDelegate {
    func didLoadView() {
        generateQuestions()
        setQuestionsToView()
    }
}

extension GameViewAdapter: GameViewDelegate {
    func didTopPlayerAnswer(_ isAnswerYes: Bool) {
        evaluateTopPlayerAnswer(isAnswerYes)
        generateTopPlayerQuestion()
        setQuestionToTopPlayerView()
    }

    func didBottomPlayerAnswer(_ isAnswerYes: Bool) {
        evaluateBottomPlayerAnswer(isAnswerYes)
        generateBottomPlayerQuestion()
        setQuestionToBottomPlayerView()
    }
}
