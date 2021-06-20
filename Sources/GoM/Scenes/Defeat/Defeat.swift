//
// Created by Jared Warren on 6/19/21.
//

import Foundation
import WarrenEngine

class Defeat: Scene {
    override func sceneDidLoad() {
        super.sceneDidLoad()
        canvas = DefeatCanvas()
    }

    override func update(deltaTime: TimeInterval) {
        super.update(deltaTime: deltaTime)
        if Input.wasMouseButtonPressed(.left) ||
               Input.wasMouseButtonPressed(.right) ||
               Input.wasMouseButtonPressed(.center) {
            Game.transition(to: GameScene())
        }
    }
}
