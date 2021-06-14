//
// Created by Jared Warren on 6/13/21.
//

import Foundation
import WarrenEngine

protocol PowerupDelegate: AnyObject {
    func powerupCollected()
}

class PowerupBehavior: Behavior, PhysicsBodyDelegate {
    weak var entity: Entity?
    weak var body: PhysicsBody?
    weak var sprite: Sprite?
    weak var delegate: PowerupDelegate?

    init(delegate: PowerupDelegate? = nil) {
        self.delegate = delegate
    }

    func behaviorWillStart() {
        sprite = getSprite()
        body = getPhysicsBody()
        body?.delegate = self
    }

    func update(_ deltaTime: TimeInterval) {
        if entityPosition.x < -32 { removeEntityFromScene() }
    }

    func behaviorWillTerminate() { }

    func bodyDidEnter(_ body: PhysicsBody) {
        // notify delegate
        delegate?.powerupCollected()
        //  cleanup self
        removeEntityFromScene()
    }

    func bodyDidExit(_ body: PhysicsBody) { }
}