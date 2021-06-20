//
// Created by Jared Warren on 6/15/21.
//

import Foundation
import WarrenEngine

class WadjetBehavior: Behavior {
    weak var entity: Entity?
    private var initialY = 0.0
    private let randomDate = Date().addingTimeInterval(Double.random(in: -1000...1000))

    func behaviorWillStart() {
        initialY = entityPosition.y
    }

    func update(_ deltaTime: TimeInterval) {
        entityPosition.y = initialY + sin(Date().timeIntervalSince(randomDate)) * 100
        if entityPosition.x < Camera.target.x - 1000 {
            removeEntityFromScene()
        }
    }

    func behaviorWillTerminate() { }
}
