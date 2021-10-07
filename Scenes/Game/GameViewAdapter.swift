import LogicKit
import UIKit

final class GameViewAdapter {
    let soundManager = SoundPlayer.sharedInstance
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
        guard let view = view else { return }

        guard let topPlayerWrittenCardText = topPlayerQuestion?.writtenPair.text else { return }
        guard let topPlayerWrittenCardColor = topPlayerQuestion?.writtenPair.color else { return }
        guard let topPlayerColoredCardText = topPlayerQuestion?.meaningPair.text else { return }
        guard let topPlayerColoredCardColor = topPlayerQuestion?.meaningPair.color else { return }
        guard let bottomPlayerWrittenCardText = bottomPlayerQuestion?.writtenPair.text else { return }
        guard let bottomPlayerWrittenCardColor = bottomPlayerQuestion?.writtenPair.color else { return }
        guard let bottomPlayerColoredCardText = bottomPlayerQuestion?.meaningPair.text else { return }
        guard let bottomPlayerColoredCardColor = bottomPlayerQuestion?.meaningPair.color else { return }

        view.setupData(topPlayerWrittenCardText: topPlayerWrittenCardText,
                        topPlayerWrittenCardColor: topPlayerWrittenCardColor,
                        topPlayerColoredCardText: topPlayerColoredCardText,
                        topPlayerColoredCardColor: topPlayerColoredCardColor,
                        bottomPlayerWrittenCardText: bottomPlayerWrittenCardText,
                        bottomPlayerWrittenCardColor: bottomPlayerWrittenCardColor,
                        bottomPlayerColoredCardText: bottomPlayerColoredCardText,
                        bottomPlayerColoredCardColor: bottomPlayerColoredCardColor)
    }

    private func evaluateTopPlayerAnswer(_ answer: String) {
        let isPlayerAnswerYes = answer == "YES"
        print("Top player answer is: \(answer) so, is isPlayerAnswerYes: \(isPlayerAnswerYes)")

        guard let isCorrectAnswerYes = topPlayerQuestion?.isAnswerYes else { return }

        if isPlayerAnswerYes == isCorrectAnswerYes {
            print("GREAT! Top player answered correctly :D. Answer given was: \(isPlayerAnswerYes) when actual answer was: \(isCorrectAnswerYes)")
            didTopPlayerAnswerCorrectly()
        } else {
            didTopPlayerAnswerIncorrectly()
            print("SORRY! Top player answer incorrectly :(. Answer given was: \(isPlayerAnswerYes) when actual answer was: \(isCorrectAnswerYes)")
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

    private func evaluateBottomPlayerAnswer(_ answer: String) {
        let isPlayerAnswerYes = answer == "YES"
        print("Bottom player answer is: \(answer) so, is isPlayerAnswerYes: \(isPlayerAnswerYes)")

        guard let isCorrectAnswerYes = bottomPlayerQuestion?.isAnswerYes else { return }

        if isPlayerAnswerYes == isCorrectAnswerYes {
            print("GREAT! Bottom player answered correctly :D. Answer given was: \(isPlayerAnswerYes) when actual answer was: \(isCorrectAnswerYes)")
            didBottomPlayerAnswerCorrectly()
        } else {
            didBottomPlayerAnswerIncorrectly()
            print("SORRY! Bottom player answer incorrectly :(. Answer given was: \(isPlayerAnswerYes) when actual answer was: \(isCorrectAnswerYes)")
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
    func didTopPlayerAnswer(_ answer: String) {
        evaluateTopPlayerAnswer(answer)
        generateTopPlayerQuestion()
        setQuestionsToView()
    }

    func didBottomPlayerAnswer(_ answer: String) {
        evaluateBottomPlayerAnswer(answer)
        generateBottomPlayerQuestion()
        setQuestionsToView()
    }
}
