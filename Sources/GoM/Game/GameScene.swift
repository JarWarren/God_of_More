//
// Created by Jared Warren on 6/13/21.
//

import Foundation
import WarrenEngine

class GameScene: Scene {

    // internal counters for spawning enemies and powerups
    private var powerupCountdown = 120
    private var wadgetCountdown = 240 // vertical "slither" flight
    private var rocCountdown = 1200 // horizontal flight
    private var petsuchosCountdown = 2400 // beams of sunlight

    // MARK: - Setup

    override func sceneDidLoad() {
        super.sceneDidLoad()
        // canvas = HUD()

        // background
        createEntity(at: .zero) {
            // background gradient
            Sprite(texture: .background)

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
        createEntity(
            at: Position(x: -16, y: Window.height / 2),
            components: { Constants.scarabComponents }
        )
    }

    // MARK: - Update

    override func update(deltaTime: TimeInterval) {
        super.update(deltaTime: deltaTime)
        Game.isDebugMode = Input.isKeyDown(.space)

        // Tell Scarabs where to fly
        ScarabBehavior.destination = Input.mousePosition

        // update counters
        powerupCountdown -= 1
        wadgetCountdown -= 1
        rocCountdown -= 1
        petsuchosCountdown -= 1
        if powerupCountdown <= 0 {
            createEntity(at: Position(x: Window.width, y: Double.random(in: 0...Window.height)), components: { Constants.powerupComponents })
            powerupCountdown = Int.random(in: 80...120)
        }
        if wadgetCountdown <= 0 {
            wadgetCountdown = Int.random(in: 200...280)
        }
        if rocCountdown <= 0 {
            createEntity(at: Position(x: Window.width, y: Window.height / 2), components: { Constants.rocComponents })
            rocCountdown = Int.random(in: 800...960)
        }
        if petsuchosCountdown <= 0 {
            createEntity(at: Position(x: Window.width, y: Window.height - 120), components: { Constants.petsuchosComponents })
            petsuchosCountdown = Int.random(in: 1000...2000)
        }
    }
}
