//
//  MenuItemDetailView.swift
//  CafeApp
//
//  Created by Diana Ruiz-Olvera on 10/4/21.
//

import UIKit

class MenuItemDetailView: UIView {
    
    //MARK: - UI Component Declarations
    
    var itemTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    let itemIconStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    
    let iconCircleView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "brown")
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 140 //view.bounds.width / 2
        return view
    }()
    
    var iconImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 5, height: 5))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor(named: "brown")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = imageView.bounds.width / 2
        return imageView
    }()
    
    let itemDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        label.textAlignment = .left
        return label
    }()
    
    let itemPriceView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "nude")
        view.layer.cornerRadius = 15
        return view
    }()
    
    let itemPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = UIColor(named: "nude")
        label.layer.masksToBounds = true
        return label
    }()
    
    let ingredientsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "cream")
        view.layer.cornerRadius = 15
        return view
    }()
    
    let ingredientsTitleLabel: UILabel = {
        let label = UILabel()
        let attributedString = NSMutableAttributedString(string: "ingredients")
        attributedString.addAttribute(NSAttributedString.Key.kern, value: 10, range: NSRange(location: 0, length: attributedString.length))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.backgroundColor = UIColor(named: "cream")
        label.textColor = .black
        label.textAlignment = .center
        label.attributedText = attributedString
        return label
    }()
    
    let itemIngredientsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.backgroundColor = UIColor(named: "cream")
        label.textColor = .systemGray
        label.textAlignment = .center
        label.text = "coffee, water"
        return label
    }()
    
    let pairingsMainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = UIColor(named: "brown")
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.layer.cornerRadius = 25
        stackView.isUserInteractionEnabled = true
        return stackView
    }()
    
    let pairingsTitleLabel: UILabel = {
        let label = UILabel()
        let attributedString = NSMutableAttributedString(string: "pairings")
        attributedString.addAttribute(NSAttributedString.Key.kern, value: 10, range: NSRange(location: 0, length: attributedString.length))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.backgroundColor = UIColor(named: "brown")
        label.textColor = .white
        label.textAlignment = .center
        label.attributedText = attributedString
        return label
    }()
    
    let pairingItemsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = UIColor(named: "brown")
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 25
        stackView.distribution = .fillEqually
        stackView.layer.cornerRadius = 20
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25)
        return stackView
    }()
 
    let randomStackView1: RandomStackView = {
        let randomStackView1 = RandomStackView()
        randomStackView1.translatesAutoresizingMaskIntoConstraints = false
        return randomStackView1
    }()
    
    let randomStackView2: RandomStackView = {
        let randomStackView2 = RandomStackView()
        randomStackView2.translatesAutoresizingMaskIntoConstraints = false
        return randomStackView2
    }()
    
    let randomStackView3: RandomStackView = {
        let randomStackView3 = RandomStackView()
        randomStackView3.translatesAutoresizingMaskIntoConstraints = false
        return randomStackView3
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setUpUI()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    func setUpUI() {
        addSubview(iconCircleView)
        addSubview(iconImageView)
        addSubview(itemPriceView)
        itemPriceView.addSubview(itemPriceLabel)
        addSubview(ingredientsView)
        ingredientsView.addSubview(ingredientsTitleLabel)
        ingredientsView.addSubview(itemIngredientsLabel)
        
        addSubview(pairingsMainStackView)
        pairingsMainStackView.addArrangedSubview(pairingsTitleLabel)
        pairingsMainStackView.addArrangedSubview(pairingItemsStackView)
        
        pairingItemsStackView.addArrangedSubview(randomStackView1)
        pairingItemsStackView.addArrangedSubview(randomStackView2)
        pairingItemsStackView.addArrangedSubview(randomStackView3)


        NSLayoutConstraint.activate([

            iconCircleView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            iconCircleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45),
            iconCircleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45),
            iconCircleView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.35),
            
            iconImageView.topAnchor.constraint(equalTo: iconCircleView.topAnchor, constant: 60),
            iconImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 100),
            iconImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -100),
            iconImageView.bottomAnchor.constraint(equalTo: iconCircleView.bottomAnchor, constant: -60),

            itemPriceView.topAnchor.constraint(equalTo: iconCircleView.bottomAnchor, constant: 85),
            itemPriceView.leadingAnchor.constraint(equalTo: iconCircleView.leadingAnchor, constant: 100),
            itemPriceView.trailingAnchor.constraint(equalTo: iconCircleView.trailingAnchor, constant: -100),
            itemPriceView.bottomAnchor.constraint(equalTo: iconCircleView.bottomAnchor, constant: 20),
            itemPriceView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.065),

            itemPriceLabel.topAnchor.constraint(equalTo: itemPriceView.topAnchor, constant: 0),
            itemPriceLabel.leadingAnchor.constraint(equalTo: itemPriceView.leadingAnchor, constant: 15),
            itemPriceLabel.trailingAnchor.constraint(equalTo: itemPriceView.trailingAnchor, constant: -15),
            itemPriceLabel.bottomAnchor.constraint(equalTo: itemPriceView.bottomAnchor, constant: 0),
            
            ingredientsView.topAnchor.constraint(equalTo: itemPriceView.bottomAnchor, constant: 15),
            ingredientsView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40),
            ingredientsView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40),
            ingredientsView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.10),
            
            ingredientsTitleLabel.topAnchor.constraint(equalTo: ingredientsView.topAnchor, constant: 0),
            ingredientsTitleLabel.leadingAnchor.constraint(equalTo: ingredientsView.leadingAnchor, constant: 20),
            ingredientsTitleLabel.trailingAnchor.constraint(equalTo: ingredientsView.trailingAnchor, constant: -20),
            ingredientsTitleLabel.heightAnchor.constraint(equalTo: ingredientsView.heightAnchor, multiplier: 0.50),
            
            itemIngredientsLabel.topAnchor.constraint(equalTo: ingredientsTitleLabel.bottomAnchor, constant: 0),
            itemIngredientsLabel.leadingAnchor.constraint(equalTo: ingredientsView.leadingAnchor, constant: 20),
            itemIngredientsLabel.trailingAnchor.constraint(equalTo: ingredientsView.trailingAnchor, constant: -20),
            itemIngredientsLabel.heightAnchor.constraint(equalTo: ingredientsView.heightAnchor, multiplier: 0.50),
            
            pairingsMainStackView.topAnchor.constraint(equalTo: ingredientsView.bottomAnchor, constant: 15),
            pairingsMainStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            pairingsMainStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0),
            pairingsMainStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            pairingsMainStackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/4),
            
            pairingsTitleLabel.topAnchor.constraint(equalTo: pairingsMainStackView.topAnchor, constant: 5),
            pairingsTitleLabel.leadingAnchor.constraint(equalTo: pairingsMainStackView.leadingAnchor, constant: 20),
            pairingsTitleLabel.bottomAnchor.constraint(equalTo: pairingsMainStackView.bottomAnchor, constant: 0),
            pairingsTitleLabel.trailingAnchor.constraint(equalTo: pairingsMainStackView.trailingAnchor, constant: -20),
            pairingsTitleLabel.heightAnchor.constraint(equalTo: pairingsMainStackView.heightAnchor, multiplier: 1/4),
            
            pairingItemsStackView.topAnchor.constraint(equalTo: pairingsTitleLabel.bottomAnchor, constant: 0),
            pairingItemsStackView.leadingAnchor.constraint(equalTo: pairingsMainStackView.leadingAnchor, constant: 0),
            pairingItemsStackView.bottomAnchor.constraint(equalTo: pairingsMainStackView.bottomAnchor, constant: 0),
            pairingItemsStackView.trailingAnchor.constraint(equalTo: pairingsMainStackView.trailingAnchor, constant: 0),
            pairingItemsStackView.heightAnchor.constraint(equalTo: pairingsMainStackView.heightAnchor, multiplier: 0.80),
            
            randomStackView1.topAnchor.constraint(equalTo: pairingItemsStackView.topAnchor, constant: 20),
            randomStackView1.bottomAnchor.constraint(equalTo: pairingItemsStackView.bottomAnchor, constant: -20),
            randomStackView1.widthAnchor.constraint(equalTo: pairingItemsStackView.widthAnchor, multiplier: 0.24),
            
            randomStackView2.topAnchor.constraint(equalTo: pairingItemsStackView.topAnchor, constant: 20),
            randomStackView2.bottomAnchor.constraint(equalTo: pairingItemsStackView.bottomAnchor, constant: -20),
            randomStackView2.widthAnchor.constraint(equalTo: pairingItemsStackView.widthAnchor, multiplier: 0.24),
            
            randomStackView3.topAnchor.constraint(equalTo: pairingItemsStackView.topAnchor, constant: 20),
            randomStackView3.bottomAnchor.constraint(equalTo: pairingItemsStackView.bottomAnchor, constant: -20),
            randomStackView3.widthAnchor.constraint(equalTo: pairingItemsStackView.widthAnchor, multiplier: 0.24),
            ])
          }
    
    func update(itemIcon: String , itemTitle: String, itemDescription: String, itemPrice: Double, itemIngredients: String) {
        iconImageView.image = UIImage(named: itemIcon)
        itemTitleLabel.text = itemTitle
        itemDescriptionLabel.text = itemDescription
        itemPriceLabel.text = String(format: "$%.02f", itemPrice)
        itemIngredientsLabel.text = itemIngredients
    }
}
