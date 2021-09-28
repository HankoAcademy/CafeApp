//
//  ContentView.swift
//  CafeApp
//
//  Created by Yunseo Lee on 9/19/21.
//

import UIKit

class ContentView: UIView {
    
    // MARK: - UI Properties
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(named: "Cream")
        tableView.register(MenuItemView.self, forCellReuseIdentifier: "MenuItemCell")
        tableView.register(TableHeaderView.self, forHeaderFooterViewReuseIdentifier: "MenuHeaderView")
        
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 100
        
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
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
            
        ])
    }
}

