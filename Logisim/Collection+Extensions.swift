//
//  Collection+Extensions.swift
//  Logisim
//
//  Created by 백상휘 on 2024/02/02.
//

import Foundation

extension Collection {
    
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
