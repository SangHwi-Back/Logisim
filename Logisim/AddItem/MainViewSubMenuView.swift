//
//  MainViewSubMenuView.swift
//  Logisim
//
//  Created by 백상휘 on 2023/12/25.
//

import UIKit

class MainViewSubMenuView: UIView {
    typealias CELL = MainViewSubMenuTableViewCell
    private let tableView = UITableView()
    
    var menus: [MainViewSubMenuModel] = [] {
        didSet { tableView.reloadData() }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.processLayer()
        addEqualEdgesSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CELL.self, forCellReuseIdentifier: String(describing: CELL.self))
    }
    
    convenience init(frame: CGRect, _ menus: [MainViewSubMenuModel]) {
        self.init(frame: frame)
        self.menus = menus
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func processLayer() {
        layer.setNormalCorner()
        layer.setNormalBorder()
        clipsToBounds = true
    }
    
    private func getCategory(in sectionNumber: Int) -> CategoryMainViewItem? {
        menus.first(where: {$0.category.sectionNumber == sectionNumber})?.category
    }
}

extension MainViewSubMenuView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let category = getCategory(in: section) else {
            return "none"
        }
        
        return String(describing: category)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CELL.self), for: indexPath) as? CELL
        
        guard let cell = cell, let model = menus[safe: indexPath.row] else {
            return UITableViewCell()
        }
        
        cell.setModel(model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        menus[safe: indexPath.row]?.handler()
        tableView.cellForRow(at: indexPath)?.setSelected(false, animated: true)
    }
    
}
