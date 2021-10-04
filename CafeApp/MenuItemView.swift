//
//  MenuItemView.swift
//  CafeApp
//
//  Created by Christian on 9/28/21.
//

import Foundation
import UIKit

class MenuItemView: UIView {
    
    private let menuItem: MenuItem
    
    var itemImage: String = "" {
        didSet {
            menuItemIcon.image = UIImage(named: itemImage)
        }
    }
    
    var itemPriceText: String = "" {
        didSet {
            itemPricing.text = itemPriceText
        }
    }
    
    var ingredientsTitle: String = "" {
        didSet {
            let attributedString = NSMutableAttributedString(string: ingredientsTitle)
            attributedString.addAttribute(NSMutableAttributedString.Key.kern, value: 10, range: NSRange(location: 0, length: attributedString.length))
            ingredientsTitleLabel.attributedText = attributedString
        }
    }
    
    var ingredientsText: String = "" {
        didSet {
            ingredients.text = ingredientsText
        }
    }
    
    let circularView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .brown
        view.layer.cornerRadius = 100
        return view
    }()
    
    let menuItemIcon: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image?.withRenderingMode(.alwaysTemplate)
        view.tintColor = UIColor(named: "cream")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let itemPricingView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        return view
    }()
    
    let itemPricing: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    let ingredientsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "cream")
        view.layer.cornerRadius = 20
        return view
    }()
    
    let ingredientsTitleLabel: UILabel = {
      let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ingredients"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    let ingredients: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    private lazy var pairingsView: PairingsView = {
        let view = PairingsView(menuItem: menuItem)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        return view
    }()

    
    init(withMenuItem menuItem: MenuItem) {
        self.menuItem = menuItem
        
        super.init(frame: .zero)
        
        backgroundColor = .white
        
        setUpUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        menuItemIcon.image = UIImage(named: menuItem.imageName)
        circularView.addSubview(menuItemIcon)
        addSubview(circularView)
        
        itemPricingView.backgroundColor = .lightGray
        itemPriceText = String(format: "$%.02f", menuItem.price)
        itemPricingView.addSubview(itemPricing)
        addSubview(itemPricingView)
        
        ingredientsTitle = "ingredients"
        ingredientsText = "coffee, water"
        
        ingredientsView.addSubview(ingredientsTitleLabel)
        ingredientsView.addSubview(ingredients)
        addSubview(ingredientsView)
        addSubview(pairingsView)
        
        NSLayoutConstraint.activate([
            circularView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 75),
            circularView.centerXAnchor.constraint(equalTo: centerXAnchor),
            circularView.heightAnchor.constraint(equalToConstant: 200),
            circularView.widthAnchor.constraint(equalTo: circularView.heightAnchor),
            
            itemPricingView.centerXAnchor.constraint(equalTo: circularView.centerXAnchor),
            itemPricingView.centerYAnchor.constraint(equalTo: circularView.bottomAnchor),
            itemPricingView.widthAnchor.constraint(equalToConstant: 50),
            itemPricingView.heightAnchor.constraint(equalToConstant: 30),
            
            itemPricing.topAnchor.constraint(equalTo: itemPricingView.topAnchor, constant: 10),
            itemPricing.leadingAnchor.constraint(equalTo: itemPricingView.leadingAnchor, constant: 10),
            
            menuItemIcon.heightAnchor.constraint(equalTo: circularView.heightAnchor, multiplier: 0.5),
            menuItemIcon.widthAnchor.constraint(equalTo: circularView.widthAnchor, multiplier: 0.5),
            menuItemIcon.centerXAnchor.constraint(equalTo: circularView.centerXAnchor),
            menuItemIcon.centerYAnchor.constraint(equalTo: circularView.centerYAnchor),
            
            ingredientsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            ingredientsView.topAnchor.constraint(equalTo: itemPricingView.bottomAnchor, constant: 20),
            ingredientsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            ingredientsView.heightAnchor.constraint(equalToConstant: 80),
            
            ingredientsTitleLabel.centerXAnchor.constraint(equalTo: ingredientsView.centerXAnchor),
            ingredientsTitleLabel.topAnchor.constraint(equalTo: ingredientsView.topAnchor, constant: 10),
            
            ingredients.topAnchor.constraint(equalTo: ingredientsTitleLabel.bottomAnchor, constant: 20),
            ingredients.leadingAnchor.constraint(equalTo: ingredientsView.leadingAnchor, constant: 20),
            
            pairingsView.topAnchor.constraint(equalTo: ingredientsView.bottomAnchor, constant: 10),
            pairingsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            pairingsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            pairingsView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }
}
