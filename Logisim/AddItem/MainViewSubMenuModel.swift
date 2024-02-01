//
//  MainViewSubMenuModel.swift
//  Logisim
//
//  Created by 백상휘 on 2023/12/25.
//

import Foundation

enum CategoryMainViewItem: Int {
    case gate
    
    var sectionNumber: Int {
        return rawValue
    }
}

struct MainViewSubMenuModel {
    var category: CategoryMainViewItem
    var name: String
    var handler: () -> Void
}
