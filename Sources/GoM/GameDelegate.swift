import Foundation
import WarrenEngine

@main
class GameDelegate: GameLauncher, VideoGameDelegate {
    func launchSettings() -> LaunchSettings {
        LaunchSettings(
            title: "God of More",
            backgroundColor: .black,
            initialWindowSize: Size(x: 1280, y: 720),
            startingScene: TitleScene()
        )
    }

    func gameWillFinishLaunching() {
        print("[Will Finish Launching]")
    }

    func gameWillTerminate() {
        print("[Will Terminate]")
    }
}
