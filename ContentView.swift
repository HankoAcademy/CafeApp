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
        
        addSubview(tableView)
        addSubview(productTableHeaderView)
        
        NSLayoutConstraint.activate([
            
            productTableHeaderView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            productTableHeaderView.leadingAnchor.constraint(equalTo: leadingAnchor),
            productTableHeaderView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
} // End of Class
