//
// Created by Jared Warren on 6/13/21.
//

import Foundation
import WarrenEngine

class ParallaxBehavior: Behavior {
    weak var entity: Entity?
    weak var background: Sprite?
    weak var pyramid0: Sprite?
    weak var pyramid1: Sprite?
    weak var city0: Sprite?
    weak var city1: Sprite?

    func behaviorWillStart() {
        background = getSprite(id: "bg")
        pyramid0 = getSprite(id: "pyramid0")
        pyramid1 = getSprite(id: "pyramid1")
        city0 = getSprite(id: "city0")
        city1 = getSprite(id: "city1")
    }

    func update(_ deltaTime: TimeInterval) {
        pyramid0?.offset.x -= 0.5
        pyramid1?.offset.x -= 0.5
        city0?.offset.x -= 1
        city1?.offset.x -= 1
        if pyramid0?.offset.x ?? 0 <= -Constants.parallaxLength { pyramid0?.offset.x = Constants.parallaxLength }
        if pyramid1?.offset.x ?? 0 <= -Constants.parallaxLength { pyramid1?.offset.x = Constants.parallaxLength }
        if city0?.offset.x ?? 0 <= -Constants.parallaxLength { city0?.offset.x = Constants.parallaxLength }
        if city1?.offset.x ?? 0 <= -Constants.parallaxLength { city1?.offset.x = Constants.parallaxLength }
        if Input.wasKeyPressed(.space) {
            Game.isDebugMode.toggle()
        }
    }

    func behaviorWillTerminate() { }
}
