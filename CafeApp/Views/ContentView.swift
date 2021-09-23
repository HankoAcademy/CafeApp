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
    
//    var menuHeaderView: 
    
 
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(named: "Cream")
        tableView.register(MenuItemDetailTableViewCell.self, forCellReuseIdentifier: "MenuItemDetailTableViewCell")
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
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
