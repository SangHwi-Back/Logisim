//
//  AndGate.swift
//  Logisim
//
//  Created by 백상휘 on 2023/12/14.
//

import UIKit

class AndGate: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 3, y: 3))
        path.addLine(to: CGPoint(x: 63, y: 3))
        path.addCurve(to: CGPoint(x: 63, y: 58),
                      controlPoint1: CGPoint(x: 83, y: 13),
                      controlPoint2: CGPoint(x: 83, y: 48))
        path.addLine(to: CGPoint(x: 3, y: 58))
        path.addCurve(to: CGPoint(x: 3, y: 3),
                      controlPoint1: CGPoint(x: 23, y: 48),
                      controlPoint2: CGPoint(x: 23, y: 13))
        path.close()
        
        path.lineWidth = 3
        path.lineCapStyle = .round
        UIColor.black.setStroke()
        path.stroke()
        UIColor.white.setFill()
        path.fill()
    }
}
