//
//  View+Extensions.swift
//  Logisim
//
//  Created by 백상휘 on 2023/12/14.
//

import UIKit

extension UIView {
    @discardableResult
    func makeGrid(
        _ spacing: CGFloat = 30,
        _ lineWidth: CGFloat = 0.5
    ) -> UIView {
        let gridBackground = UIView()
        
        var lineStartPointTop: CGFloat = 0, lineStartPointLeading: CGFloat = 0
        
        while lineStartPointTop <= frame.size.width {
            gridBackground.addSubview(
                getGridLine(CGRect(
                    x: lineStartPointTop, y: 0,
                    width: lineWidth, height: frame.size.height
                ))
            )
            lineStartPointTop += spacing
        }
        
        while lineStartPointLeading <= frame.size.height {
            gridBackground.addSubview(
                getGridLine(CGRect(
                    x: 0, y: lineStartPointLeading,
                    width: frame.size.width, height: lineWidth
                ))
            )
            lineStartPointLeading += spacing
        }
        
        self.addSubview(gridBackground)
        
        return gridBackground
    }
    
    func getGridLine(_ rect: CGRect) -> UIView {
        let line = UIView(frame: rect)
        line.backgroundColor = .lightGray
        return line
    }
}
