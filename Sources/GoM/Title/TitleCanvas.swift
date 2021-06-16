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
                    .padding()
                    .backgroundColor(.gray)
                    .padding()
                    .backgroundColor(.darkPurple)
                Spacer()
            }
            Spacer()
        }
    }
}
