//
// Created by Jared Warren on 6/13/21.
//

import Foundation
import WarrenEngine

protocol HUDDataSource: AnyObject {
    var scarabCount: Int { get }
    var distanceRemaining: Int { get }
}

struct HUD: Canvas {
    weak var dataSource: HUDDataSource?

    init(dataSource: HUDDataSource) {
        self.dataSource = dataSource
    }

    var body: Canvas {
        VStack {
            HStack(alignment: .trailing) {
                Text("\(dataSource?.scarabCount ?? 0)")
                Image("iconScarab")
                    .frame(width: 50)
                    .padding()
            }
                .frame(height: 50)
            HStack(alignment: .trailing) {
                Text("\(dataSource?.distanceRemaining ?? 11000)")
                Image("iconHorus")
                    .frame(width: 50)
                    .padding()
            }
                .frame(height: 50)
        }
            .padding()
            .foregroundColor(.gold)
    }
}
