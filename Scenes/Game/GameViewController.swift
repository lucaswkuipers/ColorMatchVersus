import UIKit

protocol GameViewControllerDelegate: AnyObject {
    func didLoadView()
}

final class GameViewController: UIViewController {

    var delegate: GameViewControllerDelegate

    init(_ delegate: GameViewControllerDelegate, with view: GameView) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
        self.view = view
        delegate.didLoadView()
    }

    required init?(coder: NSCoder) {
        fatalError()
//        super.init(coder: coder)
    }
}
