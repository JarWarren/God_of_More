//
// Created by Jared Warren on 6/13/21.
//

import Foundation
import WarrenEngine

class RocBehavior: Behavior {
    static let spriteSheet = SpriteSheet(fileName: "roc", rows: 2, columns: 5)
    weak var entity: Entity?
    internal let direction = Vector(x: -1, y: Double.random(in: -2...2))

    func behaviorWillStart() {
        guard let spriteSheet = RocBehavior.spriteSheet else { return }
        getSprite()?.animation = Animation(
            textures: spriteSheet[0...9],
            framesPerSecond: Constants.animationSpeedFPS
        )
    }

    func update(_ deltaTime: TimeInterval) {
        entityPosition += direction
    }

    func behaviorWillTerminate() { }
}
