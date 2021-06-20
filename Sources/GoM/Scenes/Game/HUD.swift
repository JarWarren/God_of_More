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
    private var scarabColor: Color {
        let count = dataSource?.scarabCount ?? 0
        return count > 49 ? .rayWhite :
            count > 39 ? .gold :
            count > 29 ? .green :
            count > 19 ? .skyBlue :
            count > 9 ? .lightGray :
            count > 1 ? .pink : .red
    }

    init(dataSource: HUDDataSource) {
        self.dataSource = dataSource
    }

    var body: Canvas {
        VStack {
            HStack(alignment: .trailing) {
                Text("\(dataSource?.scarabCount ?? 0)", fontSize: 24)
                    .foregroundColor(scarabColor)
                Image("iconScarab")
                    .frame(width: 50, height: 50)
                    .padding()
            }
            HStack(alignment: .trailing) {
                Text("\(dataSource?.distanceRemaining ?? 11000)", fontSize: 24)
                    .foregroundColor(.gold)
                Image("iconHorus")
                    .frame(width: 50, height: 50)
                    .padding()
            }
        }
            .padding()
    }
}
