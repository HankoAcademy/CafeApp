//
//  ProductDetailTableViewCell.swift
//  CafeApp
//
//  Created by Sotiri Kolvani on 9/26/21.
//

import Foundation
import UIKit


class ProductDetailTableViewCell: UITableViewCell {
    
    // MARK: - UI Properties
        
        private var leftSideStackView: UIStackView = {
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
            imageView.contentMode = .scaleAspectFit
            return imageView
       }()
        
        private var itemTitleLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
            label.textColor = .black
            label.textAlignment = .left
            return label
        }()
    
        private var itemDescriptionLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
            label.textColor = .lightGray
            label.textAlignment = .left
            return label
    }()
        
        private var itemPriceLabel: UILabel = {
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
            
            textStackView.addArrangedSubview(itemTitleLabel)
            textStackView.addArrangedSubview(itemDescriptionLabel)
                    
            leftSideStackView.addArrangedSubview(itemImageView)
            leftSideStackView.addArrangedSubview(textStackView)
                    
            contentView.addSubview(leftSideStackView)
            contentView.addSubview(itemPriceLabel)
            
            NSLayoutConstraint.activate([
                itemImageView.widthAnchor.constraint(equalToConstant: 25),
                    
                leftSideStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
                leftSideStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
                leftSideStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
                leftSideStackView.trailingAnchor.constraint(equalTo: itemPriceLabel.leadingAnchor, constant: -8),
                    
                itemPriceLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                itemPriceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
            ])
            
                itemPriceLabel.setContentHuggingPriority(.required, for: .horizontal)
                itemPriceLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        }
        
        func update(itemTitle: String, itemPrice: Double, itemImage: String, itemDescription: String) {
            
            itemTitleLabel.text = itemTitle
            itemPriceLabel.text = String(format: "$%.02f", itemPrice)
            itemImageView.image = UIImage(named: itemImage)
            itemDescriptionLabel.text = itemDescription
        }
    
    
} // End of Class
