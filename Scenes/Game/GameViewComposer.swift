import UIKit

struct GameViewComposer {

    public static func makeViewController() -> GameViewController {
        let view = GameView()
        let viewController = GameViewController(with: view)
        return viewController
    }
}
