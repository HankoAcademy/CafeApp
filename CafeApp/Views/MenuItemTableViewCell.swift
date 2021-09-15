//
//  MenuItemTableViewCell.swift
//  CafeApp
//
//  Created by Mayuko Inoue on 9/9/21.
//

import UIKit

class MenuItemTableViewCell: UITableViewCell {
    
// MARK: - UI Component Declarations
    
    private let leftSideInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let textStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let itemNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let itemDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .lightGray
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    private let itemPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
// MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        activateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - UI Configuration

    private func setupUI() {
        contentView.backgroundColor = UIColor(named: "Cream")
        
        textStackView.addArrangedSubview(itemNameLabel)
        textStackView.addArrangedSubview(itemDescriptionLabel)
        
        leftSideInfoStackView.addArrangedSubview(itemImageView)
        leftSideInfoStackView.addArrangedSubview(textStackView)
        
        contentView.addSubview(leftSideInfoStackView)
        contentView.addSubview(itemPriceLabel)
    }
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            itemImageView.widthAnchor.constraint(equalToConstant: 30),
                        
            leftSideInfoStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            leftSideInfoStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            leftSideInfoStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),            
            leftSideInfoStackView.trailingAnchor.constraint(equalTo: itemPriceLabel.leadingAnchor, constant: -8),
            
            itemPriceLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            itemPriceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
        
        itemPriceLabel.setContentHuggingPriority(.required, for: .horizontal)
        itemPriceLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
    }
    
    func update(imageName: String, itemName: String, itemDescription: String, itemPrice: Double) {
        
        itemImageView.image = UIImage(named: imageName)
        itemNameLabel.text = itemName
        itemDescriptionLabel.text = itemDescription
        itemPriceLabel.text = String(format: "$%.02f", itemPrice)
    }
}
