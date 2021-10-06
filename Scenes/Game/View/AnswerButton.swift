import UIKit

final class AnswerButton: UIButton {

    init(_ title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 50, weight: .medium)
        titleLabel?.adjustsFontSizeToFitWidth = true
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
