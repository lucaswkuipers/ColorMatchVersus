import UIKit

struct GameViewComposer {

    public static func makeViewController() -> GameViewController {
        let view = GameView()
        let adapter = GameViewAdapter()
        adapter.view = view
        view.delegate = adapter
        let viewController = GameViewController(adapter, with: view)

        return viewController
    }
}
