//
//  CircleButton.swift
//  Logisim
//
//  Created by 백상휘 on 2023/12/25.
//

import UIKit

class CircleButton: UIButton {
    var symbol: CircleButtonSymbol? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        subviews.forEach({
            $0.removeFromSuperview()
        })
        
        layer.setCircle()
        layer.backgroundColor = UIColor.lightGray.cgColor
        clipsToBounds = true
        
        if let symbol = symbol {
            setImage(UIImage(systemName: symbol.systemName(state: .highlighted)), for: .highlighted)
            setImage(UIImage(systemName: symbol.systemName(state: .normal)), for: .normal)
            tintColor = UIColor.separator
        }
    }
    
    enum CircleButtonSymbol {
        case hamburger, swipe
        
        func systemName(state: UIButton.State) -> String {
            switch self {
            case .hamburger:
                return state == .highlighted
                ? "list.bullet.rectangle.portrait.fill"
                : "list.bullet.rectangle.portrait"
            case .swipe:
                return state == .highlighted
                ? "square.stack.3d.down.forward.fill"
                : "square.stack.3d.down.right"
            }
        }
    }
    
}
