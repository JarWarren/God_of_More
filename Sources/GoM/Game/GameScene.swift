//
// Created by Jared Warren on 6/13/21.
//

import Foundation
import WarrenEngine

class GameScene: Scene {
    private var xTarget = Window.width / 2

    // MARK: - Setup

    override func sceneDidLoad() {
        super.sceneDidLoad()
        canvas = HUD()

        // background
        createEntity(at: .zero) {
            // background gradient
            Sprite(id: "bg", texture: .background, width: Int32(Window.width) + 100)

            // pyramid middleground
            Sprite(id: "pyramid0", texture: .pyramid)
            Sprite(id: "pyramid1", texture: .pyramid, offset: Vector(x: Constants.parallaxLength, y: 0))

            // city middleground
            Sprite(id: "city0", texture: .city)
            Sprite(id: "city1", texture: .city, offset: Vector(x: Constants.parallaxLength, y: 0))

            // parallax
            ParallaxBehavior()
        }

        // starter scarab
        spawnScarab()
    }

    // MARK: - Update

    override func update(deltaTime: TimeInterval) {
        super.update(deltaTime: deltaTime)
        Game.isDebugMode = Input.isKeyDown(.space)

        // update camera position
        let xPosition = Input.mousePosition.x
        if xPosition < 280 {
            xTarget -= 2
        } else if xPosition > 1000 {
            xTarget += 2
        }

        Camera.target.x = xTarget

        // Tell Scarabs where to fly
        ScarabBehavior.destination = Vector(
            x: xTarget + xPosition - Window.width / 2,
            y: Input.mousePosition.y
        )

    }

    private func spawnScarab() {
        createEntity(at: Position(x: -16, y: Window.height / 2)) {
            Sprite(
                animation: Animation(
                    textures: [
                        Texture.scarab2,
                        Texture.scarab1,
                        Texture.scarab0
                    ],
                    framesPerSecond: Constants.animationSpeedFPS
                ),
                width: 16,
                height: 16
            )
            PhysicsBody(
                shape: .circle(radius: 16),
                type: .dynamic,
                offset: Position(x: 8, y: 8),
                detectionBitMask: .two
            )
            ScarabBehavior(delegate: self)
        }
    }

    private func spawnWadjet() {
        createEntity(at: .zero) {
            Sprite(texture: .wadjet, width: 58, height: 56)
            WadjetBehavior()
            PhysicsBody(
                shape: .rectangle(size: Size(x: 58, y: 56)),
                type: .static,
                categoryBitMask: .two,
                collisionBitMask: .none
            )
        }
    }

    private func spawnPowerup() {
        createEntity(at: Position(x: Window.width, y: Double.random(in: 0...Window.height - 58))) {
            Sprite(texture: .iconScarab, width: 38, height: 58)
            PhysicsBody(
                shape: .rectangle(size: Size(x: 38, y: 58)),
                type: .static,
                collisionBitMask: .none,
                detectionBitMask: .one
            )
            PowerupBehavior(delegate: self)
        }
    }

    private func spawnRoc() {
        createEntity(
            at: Position(
                x: Window.width,
                y: Double.random(in: (Window.height * 0.3)...(Window.height * 0.7))
            )
        ) {
            Sprite(texture: .roc, width: 100, height: 120)
            RocBehavior()
            PhysicsBody(
                shape: .rectangle(size: Size(x: 100, y: 120)),
                type: .static,
                categoryBitMask: .two,
                collisionBitMask: .none
            )
        }
    }

    private func spawnPetsuchos() {
        createEntity(at: Position(x: Window.width, y: Window.height - 120)) {
            Sprite(texture: .petsuchos)
            PhysicsBody(
                shape: .rectangle(size: Size(x: 320, y: 80)),
                type: .static,
                offset: Vector(x: 0, y: 40),
                categoryBitMask: .two,
                collisionBitMask: .none
            )
        }
    }
}

extension GameScene: PowerupDelegate {
    func powerupCollected() {
        spawnScarab()
    }
}

extension GameScene: ScarabDelegate {
    func scarabDied() {
    }
}
