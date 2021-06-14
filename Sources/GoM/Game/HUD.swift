//
// Created by Jared Warren on 6/13/21.
//

import Foundation
import WarrenEngine

struct HUD: Canvas {
    var body: Canvas {
        VStack {
            Image("iconAnkh")
            Image("iconHorus")
            Image("iconScarab")
        }.frame(height: 38)
    }
}