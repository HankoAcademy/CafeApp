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

    // MARK: - Properties
    
    var headerTitle: String = "" {
        didSet {
            let attributedString = NSMutableAttributedString(string: headerTitle)
            attributedString.addAttribute(NSMutableAttributedString.Key.kern, value: 14, range: NSRange(location: 0, length: attributedString.length))
            menuHeaderLabel.attributedText = attributedString
        }
    }
    
    var hideActions: Bool = true {
        didSet {
            actionsStackView.isHidden = hideActions
        }
    }
    
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
    
    private let actionsStackView: UIStackView = {
       let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 5
        view.isHidden = true
        return view
    }()
    
    private let sortButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("sort", for: .normal)
        button.backgroundColor = UIColor(named: "cream")
        button.setTitleColor(.darkGray, for: .normal)
        button.addTarget(self, action: #selector(sortButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let filterButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("filter", for: .normal)
        button.backgroundColor = UIColor(named: "cream")
        button.setTitleColor(.darkGray, for: .normal)
        button.addTarget(self, action: #selector(filterButtonPressed), for: .touchUpInside)
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
        actionsStackView.addArrangedSubview(sortButton)
        actionsStackView.addArrangedSubview(filterButton)
        
        contentView.addSubview(actionsStackView)
        contentView.addSubview(menuHeaderLabel)
        contentView.addSubview(menuHeaderBorder)
        
        setUpConstraints()
    }
    
    // MARK: - Set Up Constraints
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            actionsStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            actionsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            actionsStackView.heightAnchor.constraint(equalToConstant: 20),
            
            menuHeaderLabel.topAnchor.constraint(equalTo: actionsStackView.bottomAnchor, constant: 16),
            menuHeaderLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            menuHeaderLabel.bottomAnchor.constraint(equalTo: menuHeaderBorder.topAnchor, constant: -16),
            
            menuHeaderBorder.leadingAnchor.constraint(equalTo: menuHeaderLabel.leadingAnchor),
            menuHeaderBorder.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            menuHeaderBorder.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            menuHeaderBorder.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    // MARK: - Delegate Methods
    
    @objc func sortButtonPressed() {
        print("Sort Button Pressed")
        sortableDelegate?.sort()
    }
    
    @objc func filterButtonPressed() {
        print("Filter Button Pressed")
        filterableDelegate?.filter()
    }

}
