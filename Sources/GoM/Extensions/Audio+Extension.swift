//
// Created by Jared Warren on 6/20/21.
//

import Foundation
import WarrenEngine

extension Audio {
    static func playGameplayMusic() {
        setBackgroundMusic(fileName: "lacrimosa", extension: .ogg)
    }

    static func playMenuMusic() {
        setBackgroundMusic(fileName: "stabatmater", extension: .ogg)
    }

    static func playAwakenSound() {
        playSound(fileName: "awaken", extension: .ogg)
    }

    static func playScreechSound() {
        playSound(fileName: "screech", extension: .ogg)
    }

    static func playLaserSound() {
        playSound(fileName: "laser", extension: .ogg)
    }
}