//
// Created by Jared Warren on 6/19/21.
//

import Foundation
import WarrenEngine

struct DefeatCanvas: Canvas {
    var body: Canvas {
        HStack {
            Spacer()
            VStack(spacing: 24) {
                Spacer()
                Text("Game Over", fontSize: 72)
                    .foregroundColor(.darkPurple)
                    .padding()
                    .backgroundColor(.gray)
                    .padding()
                    .backgroundColor(.darkPurple)
                Text("Click to play again", fontSize: 24)
                Spacer()
            }
            Spacer()
        }
            .foregroundColor(.pink)
    }
}
