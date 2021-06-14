//
// Created by Jared Warren on 6/13/21.
//

import Foundation
import WarrenEngine

class TitleScene: Scene {
    override func sceneDidLoad() {
        super.sceneDidLoad()
        createEntity(at: .zero) {
            Sprite(texture: Texture(fileName: "title"))
            TitleBehavior()
        }
    }
}
