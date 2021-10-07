import XCTest
@testable import LogicKit

final class ColorsTests: XCTestCase {
    func test_init_setupDictionaryCorrectly() {
        let (sut, colorDictionary, _, _) = makeSUT()

        XCTAssertEqual(sut.colorDictionary, colorDictionary)
    }

    func test_getColorFromText_deliversCorrectColor() {
        let (sut, _, colorText, expectedColor) = makeSUT()

        let deliveredColor = sut.getColor(from: colorText)!

        XCTAssertEqual(deliveredColor, expectedColor)
    }

    func test_getRandomColor_deliversColor() {
        let (sut, _, _, _) = makeSUT()

        let color = sut.getRandomColor()

        XCTAssertNotNil(color)
    }

    func test_getRandomColorWithException_deliversDifferentColor() {
        let (sut, _, colorText, exceptionColor) = makeSUT()

        let deliveredColor = sut.getRandomColorWithException(of: colorText)

        XCTAssertNotEqual(deliveredColor, exceptionColor)
    }

    func test_getRandomColorText_deliversText() {
        let (sut, _, _, _) = makeSUT()

        let colorText = sut.getRandomColorText()

        XCTAssertNotNil(colorText)
    }

    private func makeSUT() -> (Colors, ColorDictionary, String, UIColor) {
        let colorDictionary: ColorDictionary = ["red": .red, "green": .green, "blue": .blue]
        let (anyColorText, anyColor) = (colorDictionary.first!.key, colorDictionary.first!.value)
        let sut = Colors(from: colorDictionary)

        return (sut, colorDictionary, anyColorText, anyColor)
    }
}
