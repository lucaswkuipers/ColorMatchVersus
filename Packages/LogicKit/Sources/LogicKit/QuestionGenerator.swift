import UIKit

public struct QuestionGenerator {

    public init() {}

    public func generateQuestion(from colors: Colors, isAnswerYes: Bool = Bool.random()) -> Question? {
        guard let (meaningPairText, writtenPairColor) = generateDistractingInformation(from: colors) else { return nil }
        guard let (writtenPairText, meaningPairColor) = generateRelevantInformation(from: colors, when: isAnswerYes) else { return nil }

        let writtenPair = ColorPair(text: writtenPairText, color: writtenPairColor)
        let meaningPair = ColorPair(text: meaningPairText, color: meaningPairColor)
        let question = Question(writtenPair: writtenPair, meaningPair: meaningPair, isAnswerYes: isAnswerYes)

        return question
    }

    private func generateDistractingInformation(from colors: Colors) -> (String, UIColor)? {
        guard let meaningPairText = colors.getRandomColorText() else { return nil }
        guard let writtenPairColor = colors.getRandomColor() else { return nil }

        return (meaningPairText, writtenPairColor)
     }

    private func generateRelevantInformation(from colors: Colors, when isAnswerYes: Bool) -> (String, UIColor)? {
        guard let writtenPairText = colors.getRandomColorText() else { return nil }
        guard let meaningPairColor = isAnswerYes ? colors.getColor(from: writtenPairText) : colors.getRandomColorWithException(of: writtenPairText) else { return nil }

        return (writtenPairText, meaningPairColor)
    }
}
