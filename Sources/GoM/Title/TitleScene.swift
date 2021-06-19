//
// Created by Jared Warren on 6/13/21.
//

import Foundation
import WarrenEngine

class TitleScene: Scene {
    private var spawnCounter = 24

    override func sceneDidLoad() {
        super.sceneDidLoad()
        // title overlay
        canvas = TitleCanvas()

        // background image
        createEntity(at: .zero) {
            Sprite(texture: .background)
        }
    }

    override func update(deltaTime: TimeInterval) {
        super.update(deltaTime: deltaTime)
        Game.isDebugMode = Input.isKeyDown(.space)

        // continuously spawn dead scarabs in the background
        if spawnCounter == 0 {
            createEntity(at: Vector(x: Double.random(in: 0...Window.width), y: -16)) {
                Sprite(texture: .scarab0, width: 16, height: 16)
                ScarabBehavior(isAlive: false)
            }
            spawnCounter = 24
        } else {
            spawnCounter -= 1
        }

        // On click, begin game
        if Input.wasMouseButtonPressed(.left) ||
               Input.wasMouseButtonPressed(.right) ||
               Input.wasMouseButtonPressed(.center) {
            Game.transition(to: GameScene())
        }
    }
}
