//
//  MenuItemDetailScreenViewController.swift
//  CafeApp
//
//  Created by Raul Rodriguez III on 9/30/21.
//

import Foundation
import UIKit

class MenuItemViewController: UIViewController {
    
    // MARK: - UI Properties
    

//    //property observers: didSet
//
//    var score = 0 {
//        didSet {
//            scoreLabel.text = "Score: /(score)"
//        }
//    }
    
    private var itemIconCircleView: UIView = {
        let circleView = UIView()
        circleView.translatesAutoresizingMaskIntoConstraints = false
        circleView.backgroundColor = UIColor(named: "brown")
        circleView.layer.cornerRadius = 125
        return circleView
    }()
    
    private var itemImage: UIImageView = {
        
        let image = UIImageView(image: UIImage(named: "drinks_espresso"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private var priceLabelView: UIView = {
        let priceLabelView = UIView()
        priceLabelView.translatesAutoresizingMaskIntoConstraints = false
        priceLabelView.backgroundColor = UIColor(named: "tan")
        priceLabelView.layer.cornerRadius = 15
        return priceLabelView
    }()
    
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "$Price"
        label.textAlignment = .center
        return label
    }()
    
    private var ingredientsBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 25
        return view
    }()
    
    private var ingredientsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private var ingredientsTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ingredients"
        label.textAlignment = .center
        return label
    }()
    
    private var ingredientsContents: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "list of ingredients goes here"
        label.textColor = .lightGray
        return label
    }()
    
    private var pairingsBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "tan")
        view.layer.cornerRadius = 25
        return view
    }()
    
    private var pairingsAreaStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.distribution = .fillProportionally
        return stackView
    }()

    private var pairingsTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "pairings"
        label.textAlignment = .center
        return label
    }()
    
    // FIX ME -- TURN THIS INTO HORIZONTAL STACK VIEW W/BUTTONS
    private var testContents: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "test test test test"
        return label
    }()

    private var ItemPairingsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.distribution = .fillProportionally
        return stackView
    }()
//
//    private var pairingItemButton1: UIButton = {
//        let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("Pairing Item Name \n $Price", for: .normal)
//        button.backgroundColor = .white
//        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
//        return button
//    }()
//
//    private var pairingItemButton2: UIButton = {
//        let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("Pairing Item Name \n $Price", for: .normal)
//        button.backgroundColor = .white
//        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
//        return button
//    }()
//
//    private var pairingItemButton3: UIButton = {
//        let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("Pairing Item Name \n $Price", for: .normal)
//        button.backgroundColor = .white
//        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
//        return button
//    }()
    
    // MARK - Lifecycle
    
    override func loadView() {
        super.loadView()
        
        setUpUI()
        
        navigationItem.title = "Menu Item Detail"        
        
    }
    
    // MARK: - Set up UI
    
    private func setUpUI(){
        view.backgroundColor = UIColor(named: "cream")
        
        // item icon and price view
        
        view.addSubview(itemIconCircleView)
        view.addSubview(itemImage)
        view.addSubview(priceLabelView)
        view.addSubview(priceLabel)
        
        // ingredients view
        
        view.addSubview(ingredientsBackgroundView)
        
        ingredientsStackView.addArrangedSubview(ingredientsTitle)
        ingredientsStackView.addArrangedSubview(ingredientsContents)
        
        view.addSubview(ingredientsStackView)
        
        // pairings views
        
        view.addSubview(pairingsBackgroundView)

        pairingsAreaStackView.addArrangedSubview(pairingsTitle)
        pairingsAreaStackView.addArrangedSubview(testContents)

        view.addSubview(pairingsAreaStackView)
        
        NSLayoutConstraint.activate([
            
            itemIconCircleView.widthAnchor.constraint(equalToConstant: 250),
            itemIconCircleView.heightAnchor.constraint(equalToConstant: 250),
            itemIconCircleView.topAnchor.constraint(equalTo: view.topAnchor, constant: 125),
            itemIconCircleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            itemImage.widthAnchor.constraint(equalToConstant: 100),
            itemImage.heightAnchor.constraint(equalToConstant: 100),
            itemImage.centerXAnchor.constraint(equalTo: itemIconCircleView.centerXAnchor),
            itemImage.centerYAnchor.constraint(equalTo: itemIconCircleView.centerYAnchor),
            
            priceLabelView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            priceLabelView.heightAnchor.constraint(equalToConstant: 50),
            priceLabelView.widthAnchor.constraint(equalToConstant: 100),
            priceLabelView.topAnchor.constraint(equalTo: itemIconCircleView.bottomAnchor, constant: -40),
            
            priceLabel.centerXAnchor.constraint(equalTo: priceLabelView.centerXAnchor),
            priceLabel.centerYAnchor.constraint(equalTo: priceLabelView.centerYAnchor),
            
            // INGREDIENTS CONSTRAINTS
            
            ingredientsBackgroundView.topAnchor.constraint(equalTo: priceLabelView.bottomAnchor, constant: 25),
            ingredientsBackgroundView.heightAnchor.constraint(equalToConstant: 100),
            ingredientsBackgroundView.widthAnchor.constraint(equalToConstant: 300),
            ingredientsBackgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            ingredientsTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            ingredientsStackView.topAnchor.constraint(equalTo: ingredientsBackgroundView.topAnchor, constant: 15),
            ingredientsStackView.leadingAnchor.constraint(equalTo: ingredientsBackgroundView.leadingAnchor, constant: 15),
            
            // PAIRINGS AREA CONSTRAINTS
            
            pairingsBackgroundView.topAnchor.constraint(equalTo: ingredientsBackgroundView.bottomAnchor, constant: 25),
            pairingsBackgroundView.widthAnchor.constraint(equalToConstant: 300),
            pairingsBackgroundView.heightAnchor.constraint(equalToConstant: 150),
            pairingsBackgroundView.centerXAnchor.constraint(equalTo: itemIconCircleView.centerXAnchor),
            
            pairingsTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            pairingsAreaStackView.topAnchor.constraint(equalTo: pairingsBackgroundView.topAnchor, constant: 15),
            pairingsAreaStackView.leadingAnchor.constraint(equalTo: pairingsBackgroundView.leadingAnchor, constant: 15)
            

        ])

    
        
    }
    
    // MARK: - Actions
    
    @objc func buttonPressed() {
        navigationController?.popViewController(animated: true)
    }
    
}
