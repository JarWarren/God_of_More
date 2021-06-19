//
// Created by Jared Warren on 6/19/21.
//

import Foundation
import WarrenEngine

class GameOver: Scene {
    override func sceneDidLoad() {
        super.sceneDidLoad()
        createEntity(at: Window.center) {
            GameText(text: "Rip", color: .darkPurple, fontSize: 72)
        }
    }
}
