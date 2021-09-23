//
//  PairingsView.swift
//  CafeApp
//
//  Created by Han  on 9/17/21.
//

import UIKit

class PairingsView: UIView {
    
    let menu = Menu()
    let menuItem: MenuItem
    weak var newMenuItemViewableDelegate: NewMenuItemViewable?
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "pairings"
        return label
    }()
    
    let pairingOptionsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        return stackView
    }()
    
    lazy var firstPairingOption: PairingOptionView = {
        let pairingOptionView = PairingOptionView(newMenuItemViewableDelegate: newMenuItemViewableDelegate)
        pairingOptionView.translatesAutoresizingMaskIntoConstraints = false
        return pairingOptionView
    }()
    
    lazy var secondPairingOption: PairingOptionView = {
        let pairingOptionView = PairingOptionView(newMenuItemViewableDelegate: newMenuItemViewableDelegate)
        pairingOptionView.translatesAutoresizingMaskIntoConstraints = false
        return pairingOptionView
    }()
    
    lazy var thirdPairingOption: PairingOptionView = {
        let pairingOptionView = PairingOptionView(newMenuItemViewableDelegate: newMenuItemViewableDelegate)
        pairingOptionView.translatesAutoresizingMaskIntoConstraints = false
        return pairingOptionView
    }()
    
    init(menuItem: MenuItem, newMenuItemViewableDelegate: NewMenuItemViewable?) {
        self.menuItem = menuItem
        self.newMenuItemViewableDelegate = newMenuItemViewableDelegate
        
        super.init(frame: .zero)
        
        backgroundColor = UIColor(named: "MochaBrown")
        
        configurePairingViews()
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configurePairingViews() {
        
        switch menuItem.type {
        case .foods:
            let pairings = menu.generatePairings(forProductType: .foods)
            firstPairingOption.price = pairings[0].price
            firstPairingOption.image = UIImage(named: pairings[0].imageName)
            firstPairingOption.title = pairings[0].name
            firstPairingOption.menuItem = pairings[0]
            
            secondPairingOption.price = pairings[1].price
            secondPairingOption.image = UIImage(named: pairings[1].imageName)
            secondPairingOption.title = pairings[1].name
            secondPairingOption.menuItem = pairings[1]
            
            thirdPairingOption.price = pairings[2].price
            thirdPairingOption.image = UIImage(named: pairings[2].imageName)
            thirdPairingOption.title = pairings[2].name
            thirdPairingOption.menuItem = pairings[2]
        case .drinks:
            let pairings = menu.generatePairings(forProductType: .drinks)
            firstPairingOption.price = pairings[0].price
            firstPairingOption.image = UIImage(named: pairings[0].imageName)
            firstPairingOption.title = pairings[0].name
            firstPairingOption.menuItem = pairings[0]
            
            secondPairingOption.price = pairings[1].price
            secondPairingOption.image = UIImage(named: pairings[1].imageName)
            secondPairingOption.title = pairings[1].name
            secondPairingOption.menuItem = pairings[1]
            
            thirdPairingOption.price = pairings[2].price
            thirdPairingOption.image = UIImage(named: pairings[2].imageName)
            thirdPairingOption.title = pairings[2].name
            thirdPairingOption.menuItem = pairings[2]
        case .merchAndOthers, .misc:
            let pairings = menu.generatePairings(forProductType: .merchAndOthers)
            firstPairingOption.price = pairings[0].price
            firstPairingOption.image = UIImage(named: pairings[0].imageName)
            firstPairingOption.title = pairings[0].name
            firstPairingOption.menuItem = pairings[0]
            
            secondPairingOption.price = pairings[1].price
            secondPairingOption.image = UIImage(named: pairings[1].imageName)
            secondPairingOption.title = pairings[1].name
            secondPairingOption.menuItem = pairings[1]
            
            thirdPairingOption.price = pairings[2].price
            thirdPairingOption.image = UIImage(named: pairings[2].imageName)
            thirdPairingOption.title = pairings[2].name
            thirdPairingOption.menuItem = pairings[2]
        }
    }
    
    private func setUpViews() {
        
        addSubview(titleLabel)
        
        pairingOptionsStackView.addArrangedSubview(firstPairingOption)
        pairingOptionsStackView.addArrangedSubview(secondPairingOption)
        pairingOptionsStackView.addArrangedSubview(thirdPairingOption)
        
        addSubview(pairingOptionsStackView)
                
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: pairingOptionsStackView.topAnchor, constant: -10),
            
            pairingOptionsStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            pairingOptionsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            pairingOptionsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            pairingOptionsStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
//    func displayNewMenuItem() {
//
//        newMenuItemViewableDelegate?.displayNewMenuItemDetails(menuItem)
//    }
}
