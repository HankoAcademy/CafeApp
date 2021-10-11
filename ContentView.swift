//
//  ContentView.swift
//  CafeApp
//
//  Created by Diana Ruiz-Olvera on 9/20/21.
//

import Foundation
import UIKit

class ContentView: UIView {
    
    // MARK: - UI Components for Header
    
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
        label.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Coffee Code </> Espresso Bar"
        label.numberOfLines = 2
        return label
    }()
    
    // MARK: - UI Components for Sort & Filter
    
    let sortFilterStackView: UIStackView = {
        let sortFilterView = UIStackView()
        sortFilterView.translatesAutoresizingMaskIntoConstraints = false
        sortFilterView.axis = .horizontal
        sortFilterView.backgroundColor = UIColor(named: "cream")
        sortFilterView.distribution = .fill
        sortFilterView.spacing = -275
        sortFilterView.alignment = .fill
        sortFilterView.isLayoutMarginsRelativeArrangement = true
        sortFilterView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 3, leading: 0, bottom: 0, trailing: 20)
        return sortFilterView
    }()
    
    let sortButton: UIButton = {
        let sortButton = UIButton()
        sortButton.translatesAutoresizingMaskIntoConstraints = false
        sortButton.setTitle("sort", for: .normal)
        sortButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .light)
        sortButton.setTitleColor(.systemGray, for: .normal)
        sortButton.addTarget(self, action: #selector(sortButtonPressed), for: .touchUpInside)
        return sortButton
    }()
    
    let filterButton: UIButton = {
        let filterButton = UIButton()
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        filterButton.setTitle("filter", for: .normal)
        filterButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .light)
        filterButton.setTitleColor(.systemGray, for: .normal)
        filterButton.addTarget(self, action: #selector(filterButtonPressed), for: .touchUpInside)
        return filterButton
    }()
    
    var sortButtonAction: (() -> Void)?
    var filterButtonAction: (() -> Void)?
    
    // MARK: - UI Component for TableView
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(named: "cream")
        tableView.register(MenuTableHeaderView.self,
                           forHeaderFooterViewReuseIdentifier: "SectionHeader")
        tableView.register(MenuItemTableViewCell.self,
                           forCellReuseIdentifier: "MenuItemTableViewCell")
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 100
        return tableView
    }()
    
    // MARK: - Initializers
    
    init(sortButtonAction: @escaping () -> Void, frame: CGRect = .zero, filterButtonAction: @escaping () -> Void ) {
        self.sortButtonAction = sortButtonAction
        self.filterButtonAction = filterButtonAction
        super.init(frame: frame)
        backgroundColor = .white
        
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup Functions
    
    private func setUpViews() {
        
        addSubview(headerStackView)
    
        headerStackView.addArrangedSubview(logoImageView)
        headerStackView.addArrangedSubview(mainHeaderLabel)
        addSubview(sortFilterStackView)
        sortFilterStackView.addArrangedSubview(sortButton)
        sortFilterStackView.addArrangedSubview(filterButton)

        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            headerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            //headerStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            headerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            headerStackView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.15),
            
            sortFilterStackView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 15),
            sortFilterStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            sortFilterStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
                                            
            tableView.topAnchor.constraint(equalTo: sortFilterStackView.topAnchor, constant: 27),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    @objc func sortButtonPressed() {
        print("Sort button pressed")
        sortButtonAction?()
    }
    
    @objc func filterButtonPressed() {
        print("Filter button pressed")
        filterButtonAction?()
    }
    
}
