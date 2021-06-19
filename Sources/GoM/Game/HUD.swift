//
// Created by Jared Warren on 6/13/21.
//

import Foundation
import WarrenEngine

struct HUD: Canvas {
    var body: Canvas {
        HStack(alignment: .trailing) {
            Image("iconAnkh")
            Image("iconHorus")
            Image("iconScarab")
        }
    }
}
