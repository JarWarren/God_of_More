//
// Created by Jared Warren on 6/13/21.
//

import Foundation
import WarrenEngine

class RocBehavior: Behavior {
    weak var entity: Entity?
    internal let direction = Vector(x: -4, y: Double.random(in: -2...2))

    func behaviorWillStart() {
        Audio.playScreechSound()
    }

    func update(_ deltaTime: TimeInterval) {
        entityPosition += direction
        if entityPosition.x < Camera.target.x - 1000 { removeEntityFromScene() }
    }

    func behaviorWillTerminate() { }
}
