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

    private let pyramidScrollFactor = 0.8
    private let cityScrollFactor = 0.4
    private let foregroundScrollFactor = 1.2
    private let parallaxLength = Window.width * 2

    func behaviorWillStart() {
        background = getSprite(id: "bg")
        pyramid0 = getSprite(id: "pyramid0")
        pyramid1 = getSprite(id: "pyramid1")
        city0 = getSprite(id: "city0")
        city1 = getSprite(id: "city1")
    }

    func update(_ deltaTime: TimeInterval) {
        guard let pyramid0 = pyramid0,
              let pyramid1 = pyramid1,
              let city0 = city0,
              let city1 = city1 else { return }
        let xTarget = Camera.target.x - Window.width / 2 - 50
        background?.offset.x = xTarget
        pyramid0.offset.x = xTarget * pyramidScrollFactor
        pyramid1.offset.x = xTarget * pyramidScrollFactor + parallaxLength
        city0.offset.x = xTarget * cityScrollFactor
        city1.offset.x = xTarget * cityScrollFactor + parallaxLength
        while pyramid0.offset.x < xTarget - parallaxLength {
            pyramid0.offset.x += parallaxLength
            pyramid1.offset.x += parallaxLength
        }
        while city0.offset.x < xTarget - parallaxLength {
            city0.offset.x += parallaxLength
            city1.offset.x += parallaxLength
        }
    }

    func behaviorWillTerminate() { }
}
