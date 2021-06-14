//
// Created by Jared Warren on 6/13/21.
//

import Foundation
import WarrenEngine

class HorizontalScrollBehavior: Behavior {
    weak var entity: Entity?

    func behaviorWillStart() { }

    func update(_ deltaTime: TimeInterval) {
        entityPosition.x -= Constants.horizontalScrollSpeed
    }

    func behaviorWillTerminate() { }
}
