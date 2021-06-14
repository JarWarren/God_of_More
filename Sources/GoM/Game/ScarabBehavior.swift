//
// Created by Jared Warren on 6/13/21.
//

import Foundation
import WarrenEngine

class ScarabBehavior: Behavior {
    static var destination: Position = .zero
    weak var entity: Entity?
    weak var sprite: Sprite?
    var body: PhysicsBody!

    func behaviorWillStart() {
        body = getPhysicsBody()
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
        let direction = (ScarabBehavior.destination - entityPosition).normal * 2
        entityPosition += direction
        sprite?.isFlippedHorizontally = direction.x < 0
    }

    func behaviorWillTerminate() { }
}
