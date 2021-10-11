//
//  ContentViewTableCell.swift
//  CafeApp
//
//  Created by Christian on 9/23/21.
//

import Foundation
import UIKit

class ContentViewTableCell: UITableViewCell {
    
    // MARK: - Variables
    
    var imageName: String = "" {
        didSet {
            itemImage.image = UIImage(named: imageName)
        }
    }
    
    var price: Double = 0.0 {
        didSet {
            itemPrice.text = String(format: "$%.02f", price)
        }
    }
    
    var itemName: String = "" {
        didSet {
            itemNameLabel.text = itemName
        }
    }
    
    var itemDescription: String = "" {
        didSet {
            itemDescriptionLabel.text = itemDescription
        }
    }
    
    // MARK: - Properties
    
    private let cellStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillProportionally
        stackView.backgroundColor = UIColor(named: "cream")
        return stackView
    }()
    
    private let itemImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image?.withRenderingMode(.alwaysTemplate)
        image.tintColor = UIColor(named: "cream")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let itemPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    private let itemNameWithDescriptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.backgroundColor = UIColor(named: "cream")
        return stackView
    }()
    
    private let itemNameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    
    private let itemDescriptionLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 8, weight: .regular)
        label.textAlignment = .left
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
    
    
    // MARK: Set Up UI
    
    private func setUpUI() {
        contentView.backgroundColor = UIColor(named: "cream")
        
        addStackView()
    }
    
    private func setUpNameWithDescriptionView() {
        itemNameWithDescriptionStackView.addArrangedSubview(itemNameLabel)
        itemNameWithDescriptionStackView.addArrangedSubview(itemDescriptionLabel)
                
    }
    
    private func addStackView() {
        setUpNameWithDescriptionView()
        
        cellStackView.addArrangedSubview(itemImage)
        cellStackView.addArrangedSubview(itemNameWithDescriptionStackView)
        
        contentView.addSubview(cellStackView)
        contentView.addSubview(itemPrice)
        
        setUpConstraints()
    }
    
    // MARK: Set Up Constraints
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            itemImage.widthAnchor.constraint(equalToConstant: 40),
            
            cellStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            cellStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            cellStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            itemPrice.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            itemPrice.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
}
