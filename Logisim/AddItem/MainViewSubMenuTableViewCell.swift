//
//  MainViewSubMenuTableViewCell.swift
//  Logisim
//
//  Created by 백상휘 on 2024/02/02.
//

import UIKit

class MainViewSubMenuTableViewCell: UITableViewCell {

    private let label = UILabel()
    private var model: MainViewSubMenuModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        label.textAlignment = .left
        label.textColor = .black
        contentView.addEqualPadEdgesSubview(label, padding: 10)
        self.backgroundColor = .opaqueSeparator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setModel(_ model: MainViewSubMenuModel) {
        self.model = model
        self.label.text = model.name
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.label.text = model?.name
        setNeedsDisplay()
    }
}
