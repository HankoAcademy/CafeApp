//
//  ContentViewTableCell.swift
//  CafeApp
//
//  Created by Christian on 9/23/21.
//

import Foundation
import UIKit

class ContentViewTableCell: UITableViewCell {
    
    // MARK: - Properties
    
    private let stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
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
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpUI()
    }
    
    private func setUpUI() {
        contentView.backgroundColor = UIColor(named: "cream")
        
        stackView.addArrangedSubview(itemImage)
        stackView.addArrangedSubview(itemPrice)
        
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
        ])
    }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    func update(menuItemImage: String, menuItemPrice: Double) {
        itemImage.image = UIImage(named: menuItemImage)
        itemPrice.text = String(format: "$%.02f", menuItemPrice)
    }
    
}
