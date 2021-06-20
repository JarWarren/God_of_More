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
            HStack(alignment: .trailing, spacing: 8) {
                Text("\(dataSource?.scarabCount ?? 0)", fontSize: 24)
                    .foregroundColor(
                        .dynamicScoreColor(dataSource?.scarabCount ?? 0)
                    )
                Image("iconScarab")
                    .frame(width: 24, height: 24)
            }
            HStack(alignment: .trailing, spacing: 8) {
                Text("\(dataSource?.distanceRemaining ?? 11000)", fontSize: 24)
                    .foregroundColor(.gold)
                Image("iconHorus")
                    .frame(width: 24, height: 24)
            }
        }
            .padding()
    }
}
