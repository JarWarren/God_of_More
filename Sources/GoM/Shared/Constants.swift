//
// Created by Jared Warren on 6/13/21.
//

import Foundation
import WarrenEngine

enum Constants {
    static let parallaxLength = 2560.0
    static let animationSpeedFPS = 16
    static let horizontalScrollSpeed = 2.0

    @EntityBuilder static var scarabComponents: [Component] {
        Sprite(texture: .scarab0)
        PhysicsBody(shape: .circle(radius: 16), type: .dynamic, offset: Position(x: 8, y: 8), detectionBitMask: [.two])
        ScarabBehavior()
    }

    @EntityBuilder static var powerupComponents: [Component] {
        Sprite(texture: .iconScarab, width: 38, height: 58)
        PhysicsBody(shape: .rectangle(size: Size(x: 38, y: 58)), type: .static, collisionBitMask: .none, detectionBitMask: .one)
        PowerupBehavior()
        HorizontalScrollBehavior()
    }

    @EntityBuilder static var petsuchosComponents: [Component] {
        Sprite(texture: .petsuchos)
        PhysicsBody(shape: .rectangle(size: Size(x: 320, y: 100)), type: .static, categoryBitMask: .two, collisionBitMask: .none)
        HorizontalScrollBehavior()
    }

    @EntityBuilder static var rocComponents: [Component] {
        Sprite(texture: RocBehavior.spriteSheet![0])
        PhysicsBody(shape: .rectangle(size: Size(x: 120, y: 120)), type: .static, categoryBitMask: .two, collisionBitMask: .none)
        RocBehavior()
        HorizontalScrollBehavior()
    }
}

extension Texture {
    static let background = Texture(fileName: "bg")
    static let pyramid = Texture(fileName: "mg0")
    static let city = Texture(fileName: "mg1")
    static let scarab0 = Texture(fileName: "scarab0")
    static let scarab1 = Texture(fileName: "scarab1")
    static let scarab2 = Texture(fileName: "scarab2")
    static let iconScarab = Texture(fileName: "iconScarab")
    static let petsuchos = Texture(fileName: "petsuchos")
}
