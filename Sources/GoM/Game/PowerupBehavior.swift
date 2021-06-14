//
// Created by Jared Warren on 6/13/21.
//

import Foundation
import WarrenEngine

class PowerupBehavior: Behavior, PhysicsBodyDelegate {
    weak var entity: Entity?
    weak var body: PhysicsBody?
    weak var sprite: Sprite?

    func behaviorWillStart() {
        sprite = getSprite()
        sprite?.width = 32
        sprite?.height = 32
        body = getPhysicsBody()
        body?.delegate = self
    }

    func update(_ deltaTime: TimeInterval) {
        entityPosition.x -= Constants.horizontalScrollSpeed
    }

    func behaviorWillTerminate() { }

    func bodyDidEnter(_ body: PhysicsBody) {
        scene?.createEntity(at: Position(x: 60, y: Window.height / 2), components: { Constants.scarabComponents })
        removeEntityFromScene()
    }

    func bodyDidExit(_ body: PhysicsBody) { }
}