//
//  MenuItemWithPriceView.swift
//  CafeApp
//
//  Created by Han  on 9/17/21.
//

import UIKit

class MenuItemWithPriceView: UIView {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "drinks_coffee")
        return imageView
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "$3.50"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
//        addSubviews()
//        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews() {
        
        addSubview(imageView)
        addSubview(priceLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            priceLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            priceLabel.centerYAnchor.constraint(equalTo: imageView.bottomAnchor)
        ])
    }
}
