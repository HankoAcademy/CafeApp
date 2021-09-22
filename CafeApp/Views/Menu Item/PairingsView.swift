//
//  PairingsView.swift
//  CafeApp
//
//  Created by Han  on 9/17/21.
//

import UIKit

class PairingsView: UIView {
    
//    var firstPairingMenuItem: MenuItem {
////        let menu = Menu()
////        menu.generatePairings(forProductType: .drinks)
//    }
    
    let menuItem: MenuItem
    
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
    
    let firstPairingOption: PairingOptionView = {
        let pairingOptionView = PairingOptionView()
        pairingOptionView.translatesAutoresizingMaskIntoConstraints = false
        return pairingOptionView
    }()
    
    let secondPairingOption: PairingOptionView = {
        let pairingOptionView = PairingOptionView()
        pairingOptionView.translatesAutoresizingMaskIntoConstraints = false
        return pairingOptionView
    }()
    
    let thirdPairingOption: PairingOptionView = {
        let pairingOptionView = PairingOptionView()
        pairingOptionView.translatesAutoresizingMaskIntoConstraints = false
        return pairingOptionView
    }()
    
    init(menuItem: MenuItem) {
        self.menuItem = menuItem
        
        super.init(frame: .zero)
        
        backgroundColor = UIColor(named: "MochaBrown")
        
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
}
