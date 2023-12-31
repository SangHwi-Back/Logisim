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
        let value = min(frame.width, frame.height)
        
        if value >= 200 {
            cornerRadius = 30
        } else if value >= 80 {
            cornerRadius = 10
        } else if value > 10 {
            cornerRadius = 5
        }
    }
    
    func setCircle() {
        cornerRadius = frame.width/2
    }
}
