import UIKit

final class GameViewController: UIViewController {

    init(with view: GameView) {
        super.init(nibName: nil, bundle: nil)
        self.view = view
        
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
