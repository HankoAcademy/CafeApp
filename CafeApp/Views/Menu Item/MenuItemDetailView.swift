//
//  MenuItemDetailView.swift
//  CafeApp
//
//  Created by Han  on 9/17/21.
//

import UIKit

class MenuItemDetailView: UIView {
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = 40
        return stackView
    }()
    
    let menuItemWithPriceView: UIView = {
        let menuItemWithPriceView = MenuItemWithPriceView()
        menuItemWithPriceView.translatesAutoresizingMaskIntoConstraints = false
        return menuItemWithPriceView
    }()
    
    let ingredientsView: IngredientsView = {
        let ingredientsView = IngredientsView()
        ingredientsView.translatesAutoresizingMaskIntoConstraints = false
        return ingredientsView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews() {
        
        backgroundColor = .white
        
        stackView.addArrangedSubview(menuItemWithPriceView)
        stackView.addArrangedSubview(ingredientsView)
        
        addSubview(stackView)
//        addSubview(ingredientsView)
        
        NSLayoutConstraint.activate([
            menuItemWithPriceView.heightAnchor.constraint(equalToConstant: 300),
            menuItemWithPriceView.widthAnchor.constraint(equalToConstant: 300),
            
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            ingredientsView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 3/4, constant: 0),
            ingredientsView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/10, constant: 0)
//            ingredientsView.topAnchor.constraint(equalTo: menuItemWithPriceView, constant: <#T##CGFloat#>)
        ])
    }
}
