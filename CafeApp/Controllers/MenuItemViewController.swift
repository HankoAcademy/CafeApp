//
//  MenuItemDetailScreenViewController.swift
//  CafeApp
//
//  Created by Raul Rodriguez III on 9/30/21.
//

import Foundation
import UIKit

protocol NewMenuItemViewable: AnyObject {
    func displayNewMenuItemDetail(menuItem: MenuItem)
}

class MenuItemViewController: UIViewController, NewMenuItemViewable {
    
    // MARK: - Class Properties
    
    let menuItemSelected: MenuItem
    
    // MARK: - Initializers
    
    init(menuItemSelected: MenuItem) {
        self.menuItemSelected = menuItemSelected
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Properties
    
    
    // item icon & price
    
    private var itemIconCircleView: UIView = {
        let circleView = UIView()
        circleView.translatesAutoresizingMaskIntoConstraints = false
        circleView.backgroundColor = UIColor(named: "brown")
        circleView.layer.cornerRadius = 125
        return circleView
    }()
    
    private var itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    

    private var priceLabelView: UIView = {
        let priceLabelView = UIView()
        priceLabelView.translatesAutoresizingMaskIntoConstraints = false
        priceLabelView.backgroundColor = UIColor(named: "tan")
        priceLabelView.layer.cornerRadius = 15
        return priceLabelView
    }()
    
    private var menuItemPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    // ingredients
    
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
        label.textColor = .lightGray
        return label
    }()
    
    //pairings
    
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
        label.text = "test test test"
        label.textAlignment = .center
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
        activateConstraints()
        updateMenuItemSelected()
        
    
    }
    
    // MARK: - Set up UI
    
    private func setUpUI(){
        view.backgroundColor = UIColor(named: "cream")
        
        // item icon and price view
        
        view.addSubview(itemIconCircleView)
        view.addSubview(itemImageView)
        view.addSubview(priceLabelView)
        view.addSubview(menuItemPriceLabel)
        
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
        
    }
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            
            itemIconCircleView.widthAnchor.constraint(equalToConstant: 250),
            itemIconCircleView.heightAnchor.constraint(equalToConstant: 250),
            itemIconCircleView.topAnchor.constraint(equalTo: view.topAnchor, constant: 125),
            itemIconCircleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            itemImageView.widthAnchor.constraint(equalToConstant: 100),
            itemImageView.heightAnchor.constraint(equalToConstant: 100),
            itemImageView.centerXAnchor.constraint(equalTo: itemIconCircleView.centerXAnchor),
            itemImageView.centerYAnchor.constraint(equalTo: itemIconCircleView.centerYAnchor),
            
            priceLabelView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            priceLabelView.heightAnchor.constraint(equalToConstant: 50),
            priceLabelView.widthAnchor.constraint(equalToConstant: 100),
            priceLabelView.topAnchor.constraint(equalTo: itemIconCircleView.bottomAnchor, constant: -40),
            
            menuItemPriceLabel.centerXAnchor.constraint(equalTo: priceLabelView.centerXAnchor),
            menuItemPriceLabel.centerYAnchor.constraint(equalTo: priceLabelView.centerYAnchor),
            
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
    
//    @objc func buttonPressed() {
//        navigationController?.popViewController(animated: true)
//    }
    
    func displayNewMenuItemDetail(menuItem: MenuItem) {
        navigationController?.pushViewController(MenuItemViewController(menuItemSelected: menuItem), animated: true)
    }
    
    func updateMenuItemSelected(){
        navigationItem.title = menuItemSelected.name
        
        //FIX ME: Change from description to ingredients
        ingredientsContents.text = menuItemSelected.description
        
        menuItemPriceLabel.text = String(format: "%.02f", menuItemSelected.price)
        itemImageView.image = UIImage(named: menuItemSelected.imageName)
    }

}
