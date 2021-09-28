//
//  ProductDetailTableViewCell.swift
//  CafeApp
//
//  Created by Yunseo Lee on 9/19/21.
//

import UIKit

class MenuItemView: UITableViewCell {
    
    // MARK: - Parameter Properties
    
    var imageName: String = "" {
            didSet {
                itemImageView.image = UIImage(named: imageName)
            }
        }
        
        var itemName: String = "" {
            didSet {
                itemTitleLabel.text = itemName
            }
        }
        
        var itemDescription: String = "" {
            didSet {
                itemDescriptionLabel.text = itemDescription
            }
        }
        
        var itemPrice: Double = 0 {
            didSet {
                itemPriceLabel.text = String(format: "$%.02f", itemPrice)
            }
        }

    // MARK: - UI Properties
    
    private var sideStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .leading
        return stackView
    }()
    
    private var itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image?.withRenderingMode(.alwaysTemplate)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        return stackView
    }()
    
    private var itemTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    private var itemDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        return label
    }()

    private var itemPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
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
    
    private func setUpUI(){
        contentView.backgroundColor = UIColor(named: "Cream")
        
        setUpImageView()
        setUpTextLabel()
    }
    
    private func setUpImageView(){
        
        sideStackView.addArrangedSubview(itemImageView)
        contentView.addSubview(sideStackView)
        
        NSLayoutConstraint.activate([
            sideStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            sideStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            sideStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
    private func setUpTextLabel(){
        
        stackView.addArrangedSubview(itemTitleLabel)
        stackView.addArrangedSubview(itemPriceLabel)
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            itemTitleLabel.leadingAnchor.constraint(equalTo: sideStackView.trailingAnchor, constant: 16),
            itemImageView.widthAnchor.constraint(equalToConstant: 30),
            itemPriceLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            itemPriceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])

    }
    
    func update(itemImage: UIImage, itemTitle: String, itemPrice: Double) {
        
        itemImageView.image = itemImage
        itemTitleLabel.text = itemTitle
        itemPriceLabel.text = String(format: "$%.02f", itemPrice)
    }
}
