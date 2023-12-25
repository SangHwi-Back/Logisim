//
//  MainViewSubMenuView.swift
//  Logisim
//
//  Created by 백상휘 on 2023/12/25.
//

import UIKit

class MainViewSubMenuView: UIView {
    
    var menus: [MainViewSubMenuModel] = [] {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        addSubview(stackView)
        stackView.frame = rect.insetBy(dx: 10, dy: 10)
        stackView.distribution = .fillEqually
        
        menus.forEach { model in
            let menu = FrameOfMenu(frame: CGRect(origin: .zero, size: CGSize(width: rect.width, height: 40)), model: model)
            stackView.addArrangedSubview(menu)
        }
        
        layer.setNormalCorner()
        layer.setNormalBorder()
        
        clipsToBounds = true
    }
    
    class FrameOfMenu: UIView {
        var model: MainViewSubMenuModel?
        @objc func onTap(_ sender: Any) {
            model?.handler()
        }
        
        convenience init(frame: CGRect, model: MainViewSubMenuModel) {
            self.init(frame: frame)
            
            backgroundColor = .clear
            let stackView = UIStackView(frame: frame)
            stackView.axis = .horizontal
            stackView.spacing = 5
            stackView.backgroundColor = .clear
            addSubview(stackView)
            
            let button = UIButton()
            button.setTitle(model.name, for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.titleLabel?.minimumScaleFactor = 0.2
            button.backgroundColor = .clear
            button.addTarget(self, action: #selector(onTap(_:)), for: .touchUpInside)
            
            self.model = model
            
            stackView.addArrangedSubview(button)
        }
        
        override init(frame: CGRect) {
            super.init(frame: frame)
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
        }
    }
}
