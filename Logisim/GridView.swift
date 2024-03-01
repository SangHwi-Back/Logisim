//
//  GridView.swift
//  Logisim
//
//  Created by 백상휘 on 2024/02/04.
//

import UIKit

class GridView: UIView {
    let gridPadding: CGFloat
    
    init(frame: CGRect, gridPadding: CGFloat = 20) {
        self.gridPadding = gridPadding
        super.init(frame: frame)
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        self.gridPadding = 20
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        
        var yPosition: CGFloat = gridPadding
        path.move(to: CGPoint(x: 0, y: gridPadding))
        
        while yPosition < frame.height {
            path.addLine(to: CGPoint(x: frame.width, y: yPosition))
            
            yPosition += gridPadding
            path.move(to: CGPoint(x: 0, y: yPosition))
        }
        
        var xPosition: CGFloat = gridPadding
        path.move(to: CGPoint(x: gridPadding, y: 0))
        
        while xPosition < frame.width {
            path.addLine(to: CGPoint(x: xPosition, y: frame.height))
            
            xPosition += gridPadding
            path.move(to: CGPoint(x: xPosition, y: 0))
        }
        
        path.close()
        UIColor.lightGray.setStroke()
        path.stroke()
        path.fill()
    }
}
