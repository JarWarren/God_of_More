//
// Created by Jared Warren on 6/19/21.
//

import Foundation
import WarrenEngine

class Victory: Scene {
    override func sceneDidLoad() {
        super.sceneDidLoad()
        createEntity(at: Window.center) {
            GameText(text: "Victory", color: .green, fontSize: 72)
        }
    }
}
