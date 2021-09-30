//
//  ContentView.swift
//  CafeApp
//
//  Created by Raul Rodriguez III on 9/14/21.
//

import Foundation
import UIKit

class ContentView: UIView {
    
    // MARK: - UI Properties
    
    var menuHeaderView: MenuHeaderView = {
        let headerView = MenuHeaderView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(named: "cream")
        tableView.register(MenuItemDetailTableViewCell.self, forCellReuseIdentifier: "MenuItemDetailTableViewCell")
        tableView.register(MenuTableHeaderView.self, forHeaderFooterViewReuseIdentifier: "MenuHeaderView")
        tableView.layer.cornerRadius = 20
        return tableView
    }()
    
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    
    private func setUpViews(){
        
        addSubview(tableView)
        addSubview(menuHeaderView)
        
        NSLayoutConstraint.activate([
            
            menuHeaderView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            menuHeaderView.leadingAnchor.constraint(equalTo: leadingAnchor),
            menuHeaderView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: menuHeaderView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            
        ])
    }
}
