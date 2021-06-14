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
        body = getPhysicsBody()
        body?.delegate = self
    }

    func update(_ deltaTime: TimeInterval) {
        if entityPosition.x < -32 { removeEntityFromScene() }
    }

    func behaviorWillTerminate() { }

    // FIXME: it feels like Scene should be the delegate of powerups and scarabs in order to track live scarab count
    func bodyDidEnter(_ body: PhysicsBody) {
        scene?.createEntity(at: Position(x: -16, y: Window.height / 2), components: { Constants.scarabComponents })
        removeEntityFromScene()
    }

    func bodyDidExit(_ body: PhysicsBody) { }
}