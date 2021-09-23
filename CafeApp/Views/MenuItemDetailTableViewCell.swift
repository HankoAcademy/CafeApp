//
//  MenuItemDetailTableViewCell.swift
//  CafeApp
//
//  Created by Raul Rodriguez III on 9/14/21.
//

import Foundation
import UIKit

class MenuItemDetailTableViewCell: UITableViewCell {
    
    
    // MARK: - UI Properties
    
    private var leftSideInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        
        return stackView
    }()
    
    private var textStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        stackView.spacing = 2.5
        return stackView
    }()
    
    private var itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var menuItemTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private var menuItemDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .lightGray
        label.textAlignment = .left
        return label
    }()
    
    private var menuItemPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.textAlignment = .right
        return label
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    
    private func setUpUI() {
        
        contentView.backgroundColor = UIColor(named: "Cream")
        
        textStackView.addArrangedSubview(menuItemTitleLabel)
        textStackView.addArrangedSubview(menuItemDescriptionLabel)
        
        leftSideInfoStackView.addArrangedSubview(itemImageView)
        leftSideInfoStackView.addArrangedSubview(textStackView)
        
        contentView.addSubview(leftSideInfoStackView)
        contentView.addSubview(menuItemPriceLabel)
        
        NSLayoutConstraint.activate([
            itemImageView.widthAnchor.constraint(equalToConstant: 25),
            
            leftSideInfoStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            leftSideInfoStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            leftSideInfoStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            leftSideInfoStackView.trailingAnchor.constraint(equalTo: menuItemPriceLabel.leadingAnchor, constant: -8),
            
            menuItemPriceLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),//sets in vert center of cell
            menuItemPriceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
        
        menuItemPriceLabel.setContentHuggingPriority(.required, for: .horizontal)
        menuItemPriceLabel.setContentCompressionResistancePriority(.required, for: .horizontal)

        
    }
    
    func updateMenu(menuItemTitle: String, menuItemPrice: Double, menuItemImage: String, menuItemDescription: String) {
        menuItemTitleLabel.text = menuItemTitle
        menuItemPriceLabel.text = String(format: "%.02f", menuItemPrice)
        itemImageView.image = UIImage(named: menuItemImage)
        menuItemDescriptionLabel.text = menuItemDescription
    }
}

