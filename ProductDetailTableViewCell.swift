//
//  ProductDetailTableViewCell.swift
//  CafeApp
//
//  Created by Diana Ruiz-Olvera on 9/20/21.
//

import UIKit

class ProductDetailTableViewCell: UITableViewCell {
    
    //MARK: - UI Properties
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 16
        return stackView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        return stackView
    }()
    
    private var itemIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let itemTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private let itemDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        label.textAlignment = .left
        return label
    }()
    
    private let itemPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.textAlignment = .right
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style:style, reuseIdentifier: reuseIdentifier)
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    private func setUpUI() {
        
        contentView.backgroundColor = UIColor(named: "cream")
        
        mainStackView.addArrangedSubview(itemIconImageView)
        mainStackView.addArrangedSubview(stackView)
        mainStackView.addArrangedSubview(itemPriceLabel)
        
        stackView.addArrangedSubview(itemTitleLabel)
        stackView.addArrangedSubview(itemDescriptionLabel)

        contentView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
                        
            stackView.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 48),
            stackView.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -80)
            ])
          }
    
    func update(itemIcon: String , itemTitle: String, itemDescription: String, itemPrice: Double) {
        itemIconImageView.image = UIImage(named: itemIcon)
        itemTitleLabel.text = itemTitle
        itemDescriptionLabel.text = itemDescription
        itemPriceLabel.text = String(format: "$%.02f", itemPrice)
    }

}
