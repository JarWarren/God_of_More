//
// Created by Jared Warren on 6/15/21.
//

import Foundation
import WarrenEngine

struct TitleCanvas: Canvas {
    var body: Canvas {
        VStack(alignment: .center) {
            HStack(alignment: .center) {
                Image("title")
                    .foregroundColor(.white)
            }
            Spacer()
            HStack(spacing: 8) {
                Image("iconScarab")
                    .frame(width: 24, height: 24)
                Text("Awaken scarabs by flying to them.", fontSize: 24)
            }
                .padding()
            HStack(spacing: 8) {
                Image("iconHorus")
                    .frame(width: 24, height: 24)
                Text("Reach Horus to win.", fontSize: 24)
            }
            Spacer()
            HStack(alignment: .center) {
                Text("Click to start!", fontSize: 24)
            }
        }
            .padding()
            .foregroundColor(.darkPurple)
    }
}
