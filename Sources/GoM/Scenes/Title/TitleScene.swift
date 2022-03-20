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

    override func sceneDidAppear() {
        super.sceneDidAppear()
        Audio.playMenuMusic()
    }

    override func update(deltaTime: TimeInterval) {
        super.update(deltaTime: deltaTime)

        // On click, begin game
        if Input.wasMouseButtonPressed(.left) ||
               Input.wasMouseButtonPressed(.right) ||
               Input.wasMouseButtonPressed(.middle) {
            Game.transition(to: GameScene())
        }
    }
}
