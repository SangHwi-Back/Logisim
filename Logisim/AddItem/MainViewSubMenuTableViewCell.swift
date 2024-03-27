//
//  MainViewSubMenuTableViewCell.swift
//  Logisim
//
//  Created by 백상휘 on 2024/02/02.
//

import UIKit
import Logisim_Element

class MainViewSubMenuTableViewCell: UITableViewCell {
    private let thumbnail = UIView()
    private let label = UILabel()
    private var model: MainViewSubMenuModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        label.textAlignment = .left
        label.textColor = .black
        
        let stackView = UIStackView(arrangedSubviews: [thumbnail, label])
        stackView.spacing = 8
        thumbnail.translatesAutoresizingMaskIntoConstraints = false
        thumbnail.widthAnchor.constraint(equalTo: thumbnail.heightAnchor, multiplier: 1).isActive = true
        thumbnail.widthAnchor.constraint(greaterThanOrEqualToConstant: 40).isActive = true
        thumbnail.contentMode = .scaleAspectFit
        contentView.addEqualPadEdgesSubview(stackView, padding: 10)
        self.backgroundColor = .opaqueSeparator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setModel(_ model: MainViewSubMenuModel) {
        self.model = model
        self.label.text = model.name
        
        if thumbnail.subviews.isEmpty {
            switch model.category {
            case .gate(let gateType):
                let gate: UIView
                switch gateType {
                case .OR: gate = ORGate()
                case .AND: gate = ANDGate()
                }
                
                gate.backgroundColor = .clear
                thumbnail.addEqualEdgesSubview(gate)
            case .generator:
                let generator = PowerGenerator()
                generator.switchBlinking(false)
                thumbnail.addEqualEdgesSubview(generator)
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.label.text = model?.name
        setNeedsDisplay()
    }
}
