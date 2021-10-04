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
    
    //pairings setup
    
    private var pairingsBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "tan")
        view.layer.cornerRadius = 25
        return view
    }()
    
    private var pairingsTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Recommended Pairings"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return label
    }()

    private var itemPairingsHStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    // pairings items background views
    
    private var pairingView1: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        return view
    }()
    
    private var pairingView2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        view.layer.cornerRadius = 15
        return view
    }()
    
    private var pairingView3: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        view.layer.cornerRadius = 15
        return view
    }()
    
    // pairings items, name, price
    
    // pairing item 1
    
    private var pairing1VStack: UIStackView = {
        let vstack = UIStackView()
        vstack.translatesAutoresizingMaskIntoConstraints = false
        vstack.axis = .vertical
        vstack.distribution = .fillProportionally
        vstack.spacing = 10
        return vstack
    }()
    
    private var pairing1Image: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "drinks_espresso"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var pairing1MenuItemLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "pairing 1"
        return label
    }()
    
    private var pairing1PriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "price"
        return label
    }()
    
    // pairing item 2
    
    private var pairing2VStack: UIStackView = {
        let vstack = UIStackView()
        vstack.translatesAutoresizingMaskIntoConstraints = false
        vstack.axis = .vertical
        vstack.distribution = .fillProportionally
        vstack.spacing = 10
        return vstack
    }()
    
    private var pairing2Image: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "drinks_espresso"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var pairing2MenuItemLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "pairing 2"
        return label
    }()
    
    private var pairing2PriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "price"
        return label
    }()
    
    // pairing item 3
    
    private var pairing3VStack: UIStackView = {
        let vstack = UIStackView()
        vstack.translatesAutoresizingMaskIntoConstraints = false
        vstack.axis = .vertical
        vstack.distribution = .fillProportionally
        vstack.spacing = 10
        return vstack
    }()
    
    private var pairing3Image: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "drinks_espresso"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var pairing3MenuItemLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "pairing 3"
        return label
    }()
    
    private var pairing3PriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "price"
        return label
    }()
    

    // MARK - Lifecycle

    
    override func loadView() {
        super.loadView()
       
        // SETUP PAIRINGS OPTIONS PROPERTY DETAILS HERE // CREATE FUNC
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
        
        view.addSubview(pairingsTitle)

        itemPairingsHStackView.addArrangedSubview(pairingView1)
        itemPairingsHStackView.addArrangedSubview(pairingView2)
        itemPairingsHStackView.addArrangedSubview(pairingView3)
        
        view.addSubview(itemPairingsHStackView)
        
        // pairing1 vstack
        
        pairing1VStack.addArrangedSubview(pairing1Image)
        pairing1VStack.addArrangedSubview(pairing1MenuItemLabel)
        pairing1VStack.addArrangedSubview(pairing1PriceLabel)
        
        view.addSubview(pairing1VStack)
        
        // pairing2 vstack
        
        pairing2VStack.addArrangedSubview(pairing2Image)
        pairing2VStack.addArrangedSubview(pairing2MenuItemLabel)
        pairing2VStack.addArrangedSubview(pairing2PriceLabel)
        
        view.addSubview(pairing2VStack)
        
        // pairing3 vstack
        
        pairing3VStack.addArrangedSubview(pairing3Image)
        pairing3VStack.addArrangedSubview(pairing3MenuItemLabel)
        pairing3VStack.addArrangedSubview(pairing3PriceLabel)
        
        view.addSubview(pairing3VStack)
        
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
            pairingsBackgroundView.heightAnchor.constraint(equalToConstant: 250),
            pairingsBackgroundView.centerXAnchor.constraint(equalTo: itemIconCircleView.centerXAnchor),
            
            pairingsTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pairingsTitle.topAnchor.constraint(equalTo: pairingsBackgroundView.topAnchor, constant: 10),
            
            itemPairingsHStackView.topAnchor.constraint(equalTo: pairingsTitle.bottomAnchor, constant: 15),
            itemPairingsHStackView.leadingAnchor.constraint(equalTo: pairingsBackgroundView.leadingAnchor, constant: 15),
            itemPairingsHStackView.trailingAnchor.constraint(equalTo: pairingsBackgroundView.trailingAnchor, constant: -15),
            itemPairingsHStackView.bottomAnchor.constraint(equalTo: pairingsBackgroundView.bottomAnchor, constant: -30),
            
            // Pairing1 Vstack
            
            pairing1VStack.centerYAnchor.constraint(equalTo: pairingsBackgroundView.centerYAnchor),
            pairing1VStack.centerXAnchor.constraint(equalTo: pairingView1.centerXAnchor),

            
            // Pairing2 Vstack

            pairing2VStack.centerYAnchor.constraint(equalTo: pairingsBackgroundView.centerYAnchor),
            pairing2VStack.centerXAnchor.constraint(equalTo: pairingView2.centerXAnchor),

            // Pairing3 Vstack

            pairing3VStack.centerYAnchor.constraint(equalTo: pairingsBackgroundView.centerYAnchor),
            pairing3VStack.centerXAnchor.constraint(equalTo: pairingView3.centerXAnchor),

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
        ingredientsContents.text = menuItemSelected.ingredients?.joined(separator: ", ")
        menuItemPriceLabel.text = String(format: "%.02f", menuItemSelected.price)
        itemImageView.image = UIImage(named: menuItemSelected.imageName)
    }

//    private func configurePairingViews() {
//
//            switch menuItemSelected.type {
//            case .foods:
//                let pairings = menu.generatePairings(forProductType: .foods)
//                firstPairingOption.price = pairings[0].price
//                firstPairingOption.image = UIImage(named: pairings[0].imageName)
//                firstPairingOption.title = pairings[0].name
//                firstPairingOption.menuItem = pairings[0]
//
//                secondPairingOption.price = pairings[1].price
//                secondPairingOption.image = UIImage(named: pairings[1].imageName)
//                secondPairingOption.title = pairings[1].name
//                secondPairingOption.menuItem = pairings[1]
//
//                thirdPairingOption.price = pairings[2].price
//                thirdPairingOption.image = UIImage(named: pairings[2].imageName)
//                thirdPairingOption.title = pairings[2].name
//                thirdPairingOption.menuItem = pairings[2]
//            case .drinks:
//                let pairings = menu.generatePairings(forProductType: .drinks)
//                firstPairingOption.price = pairings[0].price
//                firstPairingOption.image = UIImage(named: pairings[0].imageName)
//                firstPairingOption.title = pairings[0].name
//                firstPairingOption.menuItem = pairings[0]
//
//                secondPairingOption.price = pairings[1].price
//                secondPairingOption.image = UIImage(named: pairings[1].imageName)
//                secondPairingOption.title = pairings[1].name
//                secondPairingOption.menuItem = pairings[1]
//
//                thirdPairingOption.price = pairings[2].price
//                thirdPairingOption.image = UIImage(named: pairings[2].imageName)
//                thirdPairingOption.title = pairings[2].name
//                thirdPairingOption.menuItem = pairings[2]
//            case .merchAndOthers, .misc:
//                let pairings = menu.generatePairings(forProductType: .merchAndOthers)
//                firstPairingOption.price = pairings[0].price
//                firstPairingOption.image = UIImage(named: pairings[0].imageName)
//                firstPairingOption.title = pairings[0].name
//                firstPairingOption.menuItem = pairings[0]
//
//                secondPairingOption.price = pairings[1].price
//                secondPairingOption.image = UIImage(named: pairings[1].imageName)
//                secondPairingOption.title = pairings[1].name
//                secondPairingOption.menuItem = pairings[1]
//
//                thirdPairingOption.price = pairings[2].price
//                thirdPairingOption.image = UIImage(named: pairings[2].imageName)
//                thirdPairingOption.title = pairings[2].name
//                thirdPairingOption.menuItem = pairings[2]
//            }
//        }
//
    
    
}

