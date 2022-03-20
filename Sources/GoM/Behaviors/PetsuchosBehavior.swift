//
// Created by Jared Warren on 6/13/21.
//

import Foundation
import WarrenEngine

class PetsuchosBehavior: Behavior {
    weak var entity: Entity?
    weak var laser: Shape?
    weak var laserBody: PhysicsBody?
    private var cooldown: Double = 240

    func behaviorWillStart() {
        laser = getShape()
        laserBody = getPhysicsBody(id: "laser")
        laserBody?.isEnabled = false
    }

    func update(_ deltaTime: TimeInterval) {
        if entityPosition.x < Camera.target.x - 1000 { removeEntityFromScene() }
        cooldown -= 1
        if cooldown <= 0 {
            cooldown = 240
            laserBody?.isEnabled = false
        } else if cooldown <= 60 {
            laserBody?.isEnabled = true
            laser?.color = .red
            if cooldown == 60,
               abs(entityPosition.x + 160 - Camera.target.x) < Window.width / 2 {
                Audio.playLaserSound()
            }
        } else if cooldown <= 120 {
            laser?.color = Color(red: 255, green: 255, blue: 255, alpha: 255 % UInt32(((cooldown - 60) / 60) * 255))
        } else {
            laser?.color = .clear
        }
    }

    func behaviorWillTerminate() { }
}
