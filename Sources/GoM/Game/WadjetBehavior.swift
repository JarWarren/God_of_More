//
// Created by Jared Warren on 6/15/21.
//

import Foundation
import WarrenEngine

class WadjetBehavior: Behavior {
    weak var entity: Entity?
    private let isAscending = Bool.random()

    func behaviorWillStart() {
        entityPosition = Position(
            x: Double.random(in: 0...Window.width),
            y: isAscending ? Window.height : -56
        )
    }

    func update(_ deltaTime: TimeInterval) {
        entityPosition.y += isAscending ? -8 : 8
    }

    func behaviorWillTerminate() { }
}
