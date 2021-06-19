//
// Created by Jared Warren on 6/13/21.
//

import Foundation
import WarrenEngine

class GameScene: Scene {
    private var xTarget = Window.width / 2
    private var scarabCount = 0

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
            Sprite(id: "pyramid1", texture: .pyramid, offset: Vector(x: Window.width * 2, y: 0))

            // city middleground
            Sprite(id: "city0", texture: .city)
            Sprite(id: "city1", texture: .city, offset: Vector(x: Window.width * 2, y: 0))

            // parallax
            ParallaxBehavior()
        }

        // starter scarab
        spawnScarab(Camera.target)

        // powerups
        for xPosition in stride(from: 1000.0, through: 10000, by: 250) {
            createEntity(at:
            Vector(
                x: xPosition,
                y: Double.random(in: 0...Window.height - 60)
            )) {
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

        // wadjets
        for xPosition in stride(from: 1000.0, through: 10000, by: 500) {
            createEntity(at:
            Vector(
                x: xPosition + Double.random(in: -100...100),
                y: Double.random(in: 100...Window.height - 200))
            ) {
                Sprite(texture: .wadjet, width: 100, height: 100)
                PhysicsBody(
                    shape: .rectangle(size: Size(x: 100, y: 100)),
                    type: .static,
                    categoryBitMask: .two,
                    collisionBitMask: .none
                )
                WadjetBehavior()
            }
        }
    }

    // MARK: - Update

    override func update(deltaTime: TimeInterval) {
        super.update(deltaTime: deltaTime)
        Game.isDebugMode = Input.isKeyDown(.space)

        // update camera position
        let mouse = Input.mousePosition
        if mouse.x > 1000 { xTarget += 2 }
        Camera.target.x = xTarget

        // Tell Scarabs where to fly
        ScarabBehavior.destination = Vector(
            x: xTarget + mouse.x - Window.width / 2,
            y: mouse.y
        )

    }

    private func spawnScarab(_ position: Vector = .zero) {
        createEntity(at: position) {
            Sprite(
                animation: .flyingScarab,
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
        scarabCount += 1
    }

    private func spawnWadjet() {
        createEntity(at: .zero) {

        }
    }

    private func spawnRoc() {
        createEntity(
            at: Position(
                x: Window.width,
                y: Double.random(in: (Window.height * 0.3)...(Window.height * 0.7))
            )
        ) {
            Sprite(texture: Texture(fileName: "roc"), width: 100, height: 120)
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
            Sprite(texture: Texture(fileName: "petsuchos"))
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
    func powerupCollected(at position: Vector) {
        spawnScarab(position)
    }
}

extension GameScene: ScarabDelegate {
    func scarabDied() {
        scarabCount -= 1
        if scarabCount <= 0 {
            Game.transition(to: GameOver())
        }
    }
}
