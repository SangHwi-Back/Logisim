//
//  View+Extensions.swift
//  Logisim
//
//  Created by 백상휘 on 2023/12/14.
//

import UIKit

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
