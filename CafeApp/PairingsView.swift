//
//  PairingsView.swift
//  CafeApp
//
//  Created by Christian on 9/30/21.
//

import Foundation
import UIKit

class PairingsView: UIView {
    
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
    
    let leftPairingItem: PairingItem = {
       let item = PairingItem()
        item.translatesAutoresizingMaskIntoConstraints = false
        item.layer.cornerRadius = 15
        return item
    }()
    
    let middlePairingItem: PairingItem = {
       let item = PairingItem()
        item.translatesAutoresizingMaskIntoConstraints = false
        item.layer.cornerRadius = 15
        return item
    }()
    
    let rightPairingItem: PairingItem = {
       let item = PairingItem()
        item.translatesAutoresizingMaskIntoConstraints = false
        item.layer.cornerRadius = 15
        return item
    }()
    
    override init(frame: CGRect) {
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
        
        leftPairingItem.pairingImageName = "foods_pie"
        leftPairingItem.pairingNameText = "Pie slice"
        leftPairingItem.pairingPriceText = "$4.50"
        
        middlePairingItem.pairingImageName = "foods_donut"
        middlePairingItem.pairingNameText = "Donut"
        middlePairingItem.pairingPriceText = "$3.50"
        
        rightPairingItem.pairingImageName = "foods_croissant"
        rightPairingItem.pairingNameText = "Croissant"
        rightPairingItem.pairingPriceText = "$4.00"
        
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
}
