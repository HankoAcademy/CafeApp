//
//  ContentView.swift
//  CafeApp
//
//  Created by Christian on 9/22/21.
//

import Foundation
import UIKit

class ContentView: UIView {
    
    // MARK: - Properties
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(named: "cream")
        return tableView
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set Up UI
    
    private func setUpUI() {
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.heightAnchor.constraint(equalTo: heightAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    
}
