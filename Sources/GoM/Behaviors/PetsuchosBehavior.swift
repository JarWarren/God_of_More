//
// Created by Jared Warren on 6/13/21.
//

import Foundation
import WarrenEngine

class PetsuchosBehavior: Behavior {
    weak var entity: Entity?

    func behaviorWillStart() { }

    func update(_ deltaTime: TimeInterval) {
        if entityPosition.x < Camera.target.x - 1000 { removeEntityFromScene() }
    }

    func behaviorWillTerminate() { }
}
