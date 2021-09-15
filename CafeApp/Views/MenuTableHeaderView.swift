//
//  MenuTableHeaderView.swift
//  CafeApp
//
//  Created by Mayuko Inoue on 9/9/21.
//

import UIKit

class MenuTableHeaderView: UITableViewHeaderFooterView {
    
    // MARK: - Class Properties
    
    var headerName: String = "" {
        didSet {
            let attributedString = NSMutableAttributedString(string: headerName)
            attributedString.addAttribute(NSAttributedString.Key.kern, value: 14, range: NSRange(location: 0, length: attributedString.length))
            headerLabel.attributedText = attributedString
        }
    }
    
    // MARK: - UI Component Declarations
    
    private var headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var bottomLineView: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: "Navy")
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    // MARK: - Initializers
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupUI()
        activateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup Functions
    
    private func setupUI() {
        contentView.backgroundColor = UIColor(named: "Cream")
        contentView.addSubview(headerLabel)
        contentView.addSubview(bottomLineView)
    }
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            headerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            headerLabel.bottomAnchor.constraint(equalTo: bottomLineView.topAnchor, constant: -12),
            
            bottomLineView.leadingAnchor.constraint(equalTo: headerLabel.leadingAnchor),
            bottomLineView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            bottomLineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bottomLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
