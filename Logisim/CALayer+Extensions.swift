//
//  CALayer+Extensions.swift
//  Logisim
//
//  Created by 백상휘 on 2023/12/25.
//

import UIKit

extension CALayer {
    func setNormalBorder() {
        borderWidth = 1
        borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    func setNormalCorner() {
        if frame.width > 100 {
            cornerRadius = 30
        } else if frame.width > 10 {
            cornerRadius = 5
        }
    }
    
    func setCircle() {
        cornerRadius = frame.width/2
    }
}
