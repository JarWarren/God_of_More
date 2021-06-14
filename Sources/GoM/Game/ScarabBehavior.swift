//
// Created by Jared Warren on 6/13/21.
//

import Foundation
import WarrenEngine

class ScarabBehavior: Behavior {
    static var destination: Position = .zero
    weak var entity: Entity?
    weak var sprite: Sprite?
    private var isAlive = true

    func behaviorWillStart() {
        sprite = getSprite()
        sprite?.animation = Animation(
            textures: [
                Texture.scarab2,
                Texture.scarab1,
                Texture.scarab0,
            ],
            framesPerSecond: Constants.animationSpeedFPS
        )
        sprite?.width = 16
        sprite?.height = 16
    }

    func update(_ deltaTime: TimeInterval) {
        if isAlive {
            let direction = (ScarabBehavior.destination - entityPosition).normal * 2
            entityPosition += direction
            sprite?.isFlippedHorizontally = direction.x < 0
            if Input.wasKeyPressed(.k) { die() }
        } else {
            entityPosition.x -= Constants.horizontalScrollSpeed
            entityPosition.y += 3
            if entityPosition.y > Window.height {
                removeEntityFromScene()
            }
        }
    }

    func die() {
        isAlive = false
        sprite?.tint = .gray
        sprite?.isFlippedVertically = true
        sprite?.animation = nil
    }

    func behaviorWillTerminate() { }
}
