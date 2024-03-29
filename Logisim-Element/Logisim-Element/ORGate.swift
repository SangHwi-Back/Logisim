//
//  ORGate.swift
//  Logisim
//
//  Created by 백상휘 on 2023/12/14.
//

import UIKit

public class ORGate: CommonGate {
    public override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        
        let origin = CGPoint(x: (rect.width / 2) - (rect.width * 0.4), y: (rect.height / 2) - (rect.height * 0.275))
        
        path.move(to: origin)
        path.addLine(to: CGPoint(x: origin.x + (rect.width * 0.6), y: origin.y))
        path.addCurve(to: CGPoint(x: origin.x + (rect.width * 0.6), y: origin.y + (rect.height * 0.55)),
                      controlPoint1: CGPoint(x: origin.x + (rect.width * 0.8), y: origin.y + (rect.height * 0.15)),
                      controlPoint2: CGPoint(x: origin.x + (rect.width * 0.8), y: origin.y + (rect.height * 0.4)))
        path.addLine(to: CGPoint(x: origin.x, y: origin.y + (rect.width * 0.55)))
        path.close()
        
        path.lineWidth = 3
        path.lineCapStyle = .round
        UIColor.black.setStroke()
        path.stroke()
        UIColor.white.setFill()
        path.fill()
    }
}
