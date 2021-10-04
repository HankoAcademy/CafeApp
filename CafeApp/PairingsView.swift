//
//  PairingsView.swift
//  CafeApp
//
//  Created by Christian on 9/30/21.
//

import Foundation
import UIKit

class PairingsView: UIView {
    
    let menu = Menu()
    private var menuItem: MenuItem
    weak var newMenuItemDelegate: NewMenuItem?
    
    var pairingsTitle: String = "" {
        didSet {
            let attributedString = NSMutableAttributedString(string: pairingsTitle)
            attributedString.addAttribute(NSMutableAttributedString.Key.kern, value: 10, range: NSRange(location: 0, length: attributedString.length))
            pairingsLabel.attributedText = attributedString
        }
    }
    
    let pairingsLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "pairings"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    let pairingsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        return stackView
    }()
    
    lazy var leftPairingItem: PairingItem = {
        let item = PairingItem(newMenuItemDelegate: newMenuItemDelegate!)
        item.translatesAutoresizingMaskIntoConstraints = false
        item.layer.cornerRadius = 15
        return item
    }()
    
    lazy var middlePairingItem: PairingItem = {
       let item = PairingItem(newMenuItemDelegate: newMenuItemDelegate!)
        item.translatesAutoresizingMaskIntoConstraints = false
        item.layer.cornerRadius = 15
        return item
    }()
    
    lazy var rightPairingItem: PairingItem = {
       let item = PairingItem(newMenuItemDelegate: newMenuItemDelegate!)
        item.translatesAutoresizingMaskIntoConstraints = false
        item.layer.cornerRadius = 15
        return item
    }()
    
    init(menuItem: MenuItem, newMenuItemDelegate: NewMenuItem?) {

        self.menuItem = menuItem
        self.newMenuItemDelegate = newMenuItemDelegate
        
        super.init(frame: .zero)
        
        backgroundColor = .brown
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        backgroundColor = .brown
        pairingsTitle = "pairings"
        addSubview(pairingsLabel)
        
        fillOutPairings()
        
        pairingsStackView.backgroundColor = .brown
        
        
        
        pairingsStackView.addArrangedSubview(leftPairingItem)
        pairingsStackView.addArrangedSubview(middlePairingItem)
        pairingsStackView.addArrangedSubview(rightPairingItem)
        
        addSubview(pairingsStackView)
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            pairingsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            pairingsLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            pairingsStackView.topAnchor.constraint(equalTo: pairingsLabel.bottomAnchor, constant: 5),
            pairingsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            pairingsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            pairingsStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }
    
    private func fillOutPairings() {
        let pairings = menu.addPairings(forMenuItem: menuItem.type)
       
        leftPairingItem.pairingImageName = pairings[0].imageName
        leftPairingItem.pairingNameText = pairings[0].name
        leftPairingItem.pairingPriceText = String(format: "$%.02f", pairings[0].price)
        leftPairingItem.menuItem = pairings[0]
        
        middlePairingItem.pairingImageName = pairings[1].imageName
        middlePairingItem.pairingNameText = pairings[1].name
        middlePairingItem.pairingPriceText = String(format: "$%.02f", pairings[1].price)
        middlePairingItem.menuItem = pairings[1]
        
        rightPairingItem.pairingImageName = pairings[2].imageName
        rightPairingItem.pairingNameText =  pairings[2].name
        rightPairingItem.pairingPriceText = String(format: "$%.02f", pairings[2].price)
        rightPairingItem.menuItem = pairings[2]
    }
}
