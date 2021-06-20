//
// Created by Jared Warren on 6/19/21.
//

import Foundation
import WarrenEngine

struct VictoryCanvas: Canvas {
    let scarabCount: Int
    var body: Canvas {
        HStack {
            Spacer()
            VStack(spacing: 24) {
                Spacer()
                Text("Victory", fontSize: 72)
                    .foregroundColor(.darkPurple)
                    .padding()
                    .backgroundColor(.gray)
                    .padding()
                    .backgroundColor(.dynamicScoreColor(scarabCount))
                HStack(spacing: 8) {
                    Text("\(scarabCount)", fontSize: 24)
                        .foregroundColor(.dynamicScoreColor(scarabCount))
                    Text("scarabs collected", fontSize: 24)
                }
                    .padding()
                Text("Click to play again", fontSize: 24)
                Spacer()
            }
            Spacer()
        }
            .foregroundColor(.pink)
    }
}
