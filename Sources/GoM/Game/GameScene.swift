//
// Created by Jared Warren on 6/13/21.
//

import Foundation
import WarrenEngine

class GameScene: Scene {
    override func sceneDidLoad() {
        super.sceneDidLoad()
        // canvas = HUD()

        // background
        createEntity(at: .zero) {
            // background gradient
            Sprite(texture: .background)

            // pyramid middleground
            Sprite(id: "pyramid0", texture: .pyramid)
            Sprite(id: "pyramid1", texture: .pyramid, offset: Vector(x: Constants.parallaxLength, y: 0))

            // city middleground
            Sprite(id: "city0", texture: .city)
            Sprite(id: "city1", texture: .city, offset: Vector(x: Constants.parallaxLength, y: 0))

            // parallax
            ParallaxBehavior()
        }

        // scarab
        createEntity(
            at: Position(x: 60, y: Window.height / 2),
            components: { Constants.scarabComponents }
        )
    }

    override func update(deltaTime: TimeInterval) {
        super.update(deltaTime: deltaTime)
        ScarabBehavior.destination = Input.mousePosition
        if Input.wasKeyPressed(.space) {
            Game.isDebugMode = true
        }
    }
}
