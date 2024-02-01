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

extension UIView {
    
    func addEqualEdgesSubview(_ subview: UIView) {
        addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.topAnchor.constraint(equalTo: topAnchor).isActive = true
        subview.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        subview.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        subview.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    func addEqualPadEdgesSubview(_ subview: UIView, padding: CGFloat) {
        addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.topAnchor.constraint(equalTo: topAnchor, constant: padding).isActive = true
        subview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1*padding).isActive = true
        subview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding).isActive = true
        subview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -1*padding).isActive = true
    }
}
