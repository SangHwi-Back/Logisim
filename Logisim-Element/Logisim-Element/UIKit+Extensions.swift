//
//  GateElements.swift
//  Logisim-Element
//
//  Created by 백상휘 on 2024/03/01.
//

import UIKit

extension CGSize {
    static var gateSize: CGSize {
        CGSize(width: 100, height: 100)
    }
}

extension CGRect {
    var withGateInset: CGRect {
        CGRect(
            origin: CGPoint(
                x: origin.x + CGFloat.commonInsetValue,
                y: origin.y + CGFloat.commonInsetValue
            ),
            size: .gateSize
        )
    }
    
    static func gateFrame(origin: CGPoint = .zero, withInset: Bool = true) -> CGRect {
        var result = CGRect(origin: origin, size: .gateSize)
        if withInset {
            result = result.withGateInset
        }
        
        return result
    }
}

extension CGFloat {
    static var commonInsetValue: CGFloat { 10 }
}
