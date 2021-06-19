//
// Created by Jared Warren on 6/13/21.
//

import Foundation
import WarrenEngine

protocol ScarabDelegate: AnyObject {
    func scarabDied()
}

class ScarabBehavior: Behavior {
    static var destination: Position = .zero
    weak var entity: Entity?
    weak var sprite: Sprite?
    weak var body: PhysicsBody?
    weak var delegate: ScarabDelegate?
    private var isAlive = true

    init(delegate: ScarabDelegate? = nil) {
        self.delegate = delegate
    }

    func behaviorWillStart() {
        body = getPhysicsBody()
        body?.delegate = self
        sprite = getSprite()
    }

    func update(_ deltaTime: TimeInterval) {
        if isAlive {
            let direction = (ScarabBehavior.destination - entityPosition).normal * 3
            entityPosition += direction
            sprite?.isFlippedHorizontally = direction.x < 0
        } else {
            entityPosition.y += 2
            if entityPosition.y > Window.height {
                removeEntityFromScene()
            }
        }
    }

    func behaviorWillTerminate() { }

    private func die() {
        guard isAlive else { return }
        isAlive = false
        sprite?.tint = .gray
        sprite?.isFlippedVertically = true
        sprite?.animation = nil
        delegate?.scarabDied()
    }
}

extension ScarabBehavior: PhysicsBodyDelegate {
    func bodyDidEnter(_ body: PhysicsBody) {
        if body.categoryBitMask.contains(.two) {
            die()
        }
    }

    func bodyDidExit(_ body: PhysicsBody) { }
}
