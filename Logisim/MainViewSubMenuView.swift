//
//  MainViewSubMenuView.swift
//  Logisim
//
//  Created by 백상휘 on 2023/12/25.
//

import UIKit

class MainViewSubMenuView: UIStackView {
    var menus: [MainViewSubMenuModel] = [] {
        didSet {
            menus.forEach { model in
                let menu = FrameOfMenu(frame: .zero, model: model)
                addArrangedSubview(menu)
                menu.translatesAutoresizingMaskIntoConstraints = false
                menu.heightAnchor.constraint(equalToConstant: 40).isActive = true
                menu.widthAnchor.constraint(greaterThanOrEqualToConstant: 40).isActive = true
            }
            
            layoutIfNeeded()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        axis = .vertical
        distribution = .fillEqually
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.setNormalCorner()
        layer.setNormalBorder()
        clipsToBounds = true
    }
    
    class FrameOfMenu: UIStackView {
        private let button = UIButton()
        private var model: MainViewSubMenuModel?
        
        @objc func onTap(_ sender: Any) {
            model?.handler()
        }
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            backgroundColor = .clear
            axis = .horizontal
            spacing = 5
            backgroundColor = .white
            
            button.setTitleColor(.black, for: .normal)
            button.titleLabel?.minimumScaleFactor = 0.2
            button.titleLabel?.textAlignment = .left
            button.contentHorizontalAlignment = .left
            button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            button.backgroundColor = .clear
            button.addTarget(self, action: #selector(onTap(_:)), for: .touchUpInside)
            
            addArrangedSubview(button)
        }
        
        convenience init(frame: CGRect, model: MainViewSubMenuModel) {
            self.init(frame: frame)
            self.model = model
            button.setTitle(model.name, for: .normal)
        }
        
        required init(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
