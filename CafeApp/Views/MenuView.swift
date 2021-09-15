//
//  MenuView.swift
//  CafeApp
//
//  Created by Hannie Kim on 9/14/21.
//

import UIKit

class MenuView: UIView {

    // MARK: - UI Properties
    
    var menuHeaderView: MenuHeaderView = {
        let headerView = MenuHeaderView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    
    let menuTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(named: "Cream")
        tableView.layer.cornerRadius = 20
        tableView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tableView.allowsSelection = false
        tableView.register(MenuItemTableViewCell.self, forCellReuseIdentifier: "DefaultItemCell")
        tableView.register(MenuTableHeaderView.self, forHeaderFooterViewReuseIdentifier: "MenuTableHeaderView")
        return tableView
    }()
        
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        setUpUI()
        activateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    
    private func setUpUI() {
        
        backgroundColor = .white
        
        addSubview(menuHeaderView)
        addSubview(menuTableView)
    }
    
    private func activateConstraints() {
        
        NSLayoutConstraint.activate([
            menuHeaderView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            menuHeaderView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 26),
            menuHeaderView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -26),
            
            menuTableView.topAnchor.constraint(equalTo: menuHeaderView.bottomAnchor, constant: 24),
            menuTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            menuTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            menuTableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
