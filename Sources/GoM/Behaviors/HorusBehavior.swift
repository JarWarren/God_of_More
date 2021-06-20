//
// Created by Jared Warren on 6/20/21.
//

import Foundation
import WarrenEngine

protocol HorusDelegate: AnyObject {
    func horusWasReached()
}

class HorusBehavior: Behavior {
    weak var entity: Entity?
    weak var delegate: HorusDelegate?
    weak var body: PhysicsBody?

    init(_ delegate: HorusDelegate) {
        self.delegate = delegate
    }

    func behaviorWillStart() {
        body = getPhysicsBody()
        body?.delegate = self
    }
    func update(_ deltaTime: TimeInterval) { }
    func behaviorWillTerminate() { }
}

extension HorusBehavior: PhysicsBodyDelegate {
    public func bodyDidEnter(_ body: PhysicsBody) {
        if body.categoryBitMask == .one {
            delegate?.horusWasReached()
            self.body?.isEnabled = false
        }
    }

    public func bodyDidExit(_ body: PhysicsBody) { }
}
