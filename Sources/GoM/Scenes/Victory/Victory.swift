//
// Created by Jared Warren on 6/19/21.
//

import Foundation
import WarrenEngine

class Victory: Scene {
    private let scarabCount: Int

    init(_ scarabCount: Int) {
        self.scarabCount = scarabCount
    }

    override func sceneDidLoad() {
        super.sceneDidLoad()
        canvas = VictoryCanvas(scarabCount: scarabCount)
    }

    override func update(deltaTime: TimeInterval) {
        super.update(deltaTime: deltaTime)
        if Input.wasMouseButtonPressed(.left) ||
               Input.wasMouseButtonPressed(.right) ||
               Input.wasMouseButtonPressed(.center) {
            Game.transition(to: GameScene())
        }
    }
}
