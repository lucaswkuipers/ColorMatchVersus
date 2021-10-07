import UIKit

public struct Colors {
    let colorDictionary: ColorDictionary

    public init(from colorDictionary: ColorDictionary) {
        self.colorDictionary = colorDictionary
    }

    func getColor(from text: String) -> UIColor? {
        return colorDictionary[text]
    }

    func getRandomColor() -> UIColor? {
        return colorDictionary.randomElement()?.value
    }

    func getRandomColorWithException(of colorText: String) -> UIColor? {
        return colorDictionary.filter({$0.key != colorText}).randomElement()?.value
    }

    func getRandomColorText() -> String? {
        return colorDictionary.randomElement()?.key
    }
}

