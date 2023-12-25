//
//  ORGate.swift
//  Logisim
//
//  Created by 백상휘 on 2023/12/14.
//

import UIKit

class ORGate: UIView {
    override init(frame: CGRect) {
        super.init(frame: CGRect(origin: frame.origin, size: CGSize(width: 100, height: 100)))
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        let origin = CGPoint(x: (rect.width / 2) - 40, y: (rect.height / 2) - 27.5)
        
        path.move(to: origin)
        path.addLine(to: CGPoint(x: origin.x + 60, y: origin.y))
        path.addCurve(to: CGPoint(x: origin.x + 60, y: origin.y + 55),
                      controlPoint1: CGPoint(x: origin.x + 80, y: origin.y + 15),
                      controlPoint2: CGPoint(x: origin.x + 80, y: origin.y + 40))
        path.addLine(to: CGPoint(x: origin.x, y: origin.y + 55))
        path.close()
        
        path.lineWidth = 3
        path.lineCapStyle = .round
        UIColor.black.setStroke()
        path.stroke()
        UIColor.white.setFill()
        path.fill()
    }
}
