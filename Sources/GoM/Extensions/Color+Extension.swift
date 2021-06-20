//
// Created by Jared Warren on 6/19/21.
//

import Foundation
import WarrenEngine

extension Color {
    static func dynamicScoreColor(_ score: Int) -> Color {
        score > 49 ? .rayWhite :
            score > 39 ? .gold :
            score > 29 ? .green :
            score > 19 ? .skyBlue :
            score > 9 ? .lightGray :
            score > 1 ? .pink : .red
    }
}
