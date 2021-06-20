//
// Created by Jared Warren on 6/15/21.
//

import Foundation
import WarrenEngine

struct TitleCanvas: Canvas {
    var body: Canvas {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Image("title")
                .foregroundColor(.white)
                Spacer()
            }
            Spacer()
            Text("Scarabs follow your finger.", fontSize: 24)
            HStack(spacing: 8) {
                Image("iconScarab")
                    .frame(width: 24, height: 24)
                Text("Awaken more by flying to them.", fontSize: 24)
            }
            .padding()
            Text("Click to start!", fontSize: 24)
            Spacer()
        }
            .padding()
            .foregroundColor(.darkPurple)
    }
}
