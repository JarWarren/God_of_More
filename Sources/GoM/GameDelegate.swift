import Foundation
import WarrenEngine

class GameDelegate: GameLauncher, VideoGameDelegate {
    func launchSettings() -> LaunchSettings {
        LaunchSettings(
            title: "God of More",
            backgroundColor: .black,
            initialWindowSize: Vector(x: 1280, y: 720),
            startingScene: TitleScene()
        )
    }

    required init(with module: Bundle) {
        super.init(with: module)
    }

    func gameWillFinishLaunching() {
        print("Hello, World!")
    }

    func gameWillTerminate() {
        print("Goodbye!")
    }
}