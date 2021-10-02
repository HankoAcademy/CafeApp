//
//  MenuTableHeaderView.swift
//  CafeApp
//
//  Created by Christian on 9/25/21.
//

import UIKit

class MenuTableHeaderView: UITableViewHeaderFooterView {
    
    weak var sortableDelegate: Sortable?
    weak var filterableDelegate: Filterable?

    
    var headerTitle: String = "" {
        didSet {
            let attributedString = NSMutableAttributedString(string: headerTitle)
            attributedString.addAttribute(NSMutableAttributedString.Key.kern, value: 14, range: NSRange(location: 0, length: attributedString.length))
            menuHeaderLabel.attributedText = attributedString
        }
    }
    
    // MARK: - Properties
    
    private let menuHeaderLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .left
        label.textColor = .darkGray
        return label
    }()
    
    private let menuHeaderBorder: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "Navy")
        return view
    }()
    
    private let sortButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sort", for: .normal)
        button.backgroundColor = UIColor(named: "cream")
        button.setTitleColor(.lightGray, for: .normal)
        button.addTarget(self, action: #selector(sortButtonPressed), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Initializers
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setUpUI()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set Up UI
    
    private func setUpUI() {
        // contentView.backgroundColor = UIColor(named: "cream")
        
        contentView.addSubview(menuHeaderLabel)
        contentView.addSubview(sortButton)
        contentView.addSubview(menuHeaderBorder)
                
        NSLayoutConstraint.activate([
            menuHeaderLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            menuHeaderLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            menuHeaderLabel.bottomAnchor.constraint(equalTo: menuHeaderBorder.topAnchor, constant: -16),
            
            //sortButton.leadingAnchor.constraint(equalTo: menuHeaderLabel.trailingAnchor),
            //sortButton.bottomAnchor.constraint(equalTo: menuHeaderLabel.bottomAnchor),
            sortButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            sortButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            //sortButton.centerYAnchor.constraint(equalTo: menuHeaderLabel.centerYAnchor),
            //sortButton.heightAnchor.constraint(equalToConstant: 8),
            
            menuHeaderBorder.leadingAnchor.constraint(equalTo: menuHeaderLabel.leadingAnchor),
            menuHeaderBorder.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            menuHeaderBorder.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            menuHeaderBorder.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    @objc func sortButtonPressed() {
        print("Sort Button Pressed")
        sortableDelegate?.sort()
    }

}
