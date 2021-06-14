//
// Created by Jared Warren on 6/13/21.
//

import Foundation
import WarrenEngine

class TitleBehavior: Behavior {
    weak var entity: Entity?

    func behaviorWillStart() { }

    func update(_ deltaTime: TimeInterval) {
        if Input.wasKeyPressed(.space) ||
               Input.wasMouseButtonPressed(.left) ||
               Input.wasMouseButtonPressed(.right) ||
               Input.wasMouseButtonPressed(.center) {
            Game.transition(to: GameScene())
        }
    }

    func behaviorWillTerminate() { }
}
