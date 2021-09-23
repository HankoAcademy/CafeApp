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
    
    let cafeLogoView: CafeLogoView = {
        let cafeLogoView = CafeLogoView()
        cafeLogoView.translatesAutoresizingMaskIntoConstraints = false
        return cafeLogoView
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
        
        addLogoStackView()
        addTableView()
    }
    
    private func addLogoStackView() {
        addSubview(cafeLogoView)
        
        NSLayoutConstraint.activate([
            cafeLogoView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            cafeLogoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            cafeLogoView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            cafeLogoView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func addTableView() {
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.topAnchor.constraint(equalTo: cafeLogoView.bottomAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    
}
