//
//  ContentView.swift
//  CafeApp
//
//  Created by Diana Ruiz-Olvera on 9/20/21.
//

import Foundation
import UIKit

class ContentView: UIView {
    
    // Mark: - UI Properties
    
    let headerStackView: UIStackView = {
        let headerStackView = UIStackView()
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        headerStackView.axis = .horizontal
        headerStackView.distribution = .fillProportionally
        headerStackView.spacing = 10
        return headerStackView
    }()
    
    let mainHeaderView: UIView = {
        let mainHeaderView = UIView()
        mainHeaderView.translatesAutoresizingMaskIntoConstraints = false
        mainHeaderView.backgroundColor = .white
        return mainHeaderView
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logo_coffee")
        return imageView
    }()
    
    let mainHeaderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 40, weight: .medium)
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Hanko Cafe"
        return label
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.register(ProductDetailTableViewCell.self,
                           forCellReuseIdentifier: "ProductDetailTableViewCell")
        tableView.register(MyCustomHeader.self,
                           forHeaderFooterViewReuseIdentifier: "sectionHeader")
        return tableView
    }()
    
    // Mark: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Mark: - UI Setup
    
    private func setUpViews() {
        
        addSubview(headerStackView)
    
        headerStackView.addArrangedSubview(logoImageView)
        headerStackView.addArrangedSubview(mainHeaderLabel)
        
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            headerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            headerStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            headerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            headerStackView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.15),
                                            
            tableView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 15),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
}
