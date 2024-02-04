//
//  MainViewSubMenuModel.swift
//  Logisim
//
//  Created by 백상휘 on 2023/12/25.
//

import Foundation

enum CategoryMainViewItem: Hashable {
    enum GateType {
    case OR, AND
    }
    
    case gate(GateType)
    
    var sectionNumber: Int {
        switch self {
        case .gate(_): return 0
        }
    }
}

struct MainViewSubMenuModel {
    var category: CategoryMainViewItem
    var name: String
    var handler: () -> Void
}
