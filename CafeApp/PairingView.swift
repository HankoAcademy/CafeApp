//
//  PairingView.swift
//  CafeApp
//
//  Created by Christian on 10/2/21.
//

import Foundation
import UIKit

class PairingItem: UIView {
    
    var pairingImageName: String = "" {
        didSet {
            pairingIcon.image = UIImage(named: pairingImageName)
        }
    }
    
    var pairingNameText: String = "" {
        didSet {
            pairingName.text = pairingNameText
        }
    }
    
    var pairingPriceText: String = "" {
        didSet {
            pairingPrice.text = pairingPriceText
        }
    }
    
    let pairingIcon: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image?.withRenderingMode(.alwaysTemplate)
        view.tintColor = UIColor(named: "cream")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let pairingName: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    let pairingPrice: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 8, weight: .light)
        label.textAlignment = .center
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        backgroundColor = UIColor(named: "cream")
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        addSubview(pairingIcon)
        addSubview(pairingName)
        addSubview(pairingPrice)
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            pairingIcon.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            pairingIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            pairingIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            pairingIcon.heightAnchor.constraint(equalToConstant: 20),
            
            pairingName.topAnchor.constraint(equalTo: pairingIcon.bottomAnchor, constant: 5),
            pairingName.centerXAnchor.constraint(equalTo: pairingIcon.centerXAnchor),
            
            pairingPrice.topAnchor.constraint(equalTo: pairingName.bottomAnchor, constant: 5),
            pairingPrice.centerXAnchor.constraint(equalTo: pairingName.centerXAnchor),
            pairingPrice.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
        ])
    }
}
