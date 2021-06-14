//
// Created by Jared Warren on 6/13/21.
//

import Foundation
import WarrenEngine

enum Constants {
    static let parallaxLength = 2560.0
    static let animationSpeedFPS = 16
    @EntityBuilder static var scarabComponents: [Component] {
        Sprite(texture: .scarab0)
        PhysicsBody(shape: .circle(radius: 16), type: .dynamic, offset: Position(x: 8, y: 8))
        ScarabBehavior()
    }
}

extension Texture {
    static let background = Texture(fileName: "bg")
    static let pyramid = Texture(fileName: "mg0")
    static let city = Texture(fileName: "mg1")
    static let scarab0 = Texture(fileName: "scarab0")
    static let scarab1 = Texture(fileName: "scarab1")
    static let scarab2 = Texture(fileName: "scarab2")
}