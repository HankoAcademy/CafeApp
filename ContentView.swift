//
//  ContentView.swift
//  CafeApp
//
//  Created by Sotiri Kolvani on 9/26/21.
//

import Foundation
import UIKit


class ContentView: UIView {

    // MARK: - UI Properties
    
    var menuHeaderView: MenuHeaderView = {
           let menuHeaderView = MenuHeaderView()
           menuHeaderView.translatesAutoresizingMaskIntoConstraints = false
           return menuHeaderView
       }()
    
    var productTableHeaderView: ProductTableHeaderView = {
           let headerView = ProductTableHeaderView()
           headerView.translatesAutoresizingMaskIntoConstraints = false
           return headerView
       }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(named: "Cream")
        tableView.register(ProductDetailTableViewCell.self, forCellReuseIdentifier: "ProductDetailTableViewCell")
        tableView.register(ProductTableHeaderView.self, forHeaderFooterViewReuseIdentifier: "ProductTableHeaderView")
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
    
    private func setUpViews() {
        
        addSubview(menuHeaderView)
        addSubview(tableView)
        // addSubview(productTableHeaderView)
        
        NSLayoutConstraint.activate([
            
            menuHeaderView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            menuHeaderView.leadingAnchor.constraint(equalTo: leadingAnchor),
            menuHeaderView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: menuHeaderView.bottomAnchor, constant: 10
            ),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
} // End of Class
