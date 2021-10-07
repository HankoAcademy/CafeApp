//
//  RandomStackView.swift
//  CafeApp
//
//  Created by Diana Ruiz-Olvera on 10/5/21.
//

import UIKit

class RandomStackView: UIStackView {
    
    //MARK: - UI Component Declarations
    
    let randomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = UIColor(named: "cream")
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = 9
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layer.cornerRadius = 20
        stackView.sizeToFit()
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 12, leading: 10, bottom: 12, trailing: 10)
        stackView.isUserInteractionEnabled = true
        return stackView
    }()
    
    var pairingItemTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .black
        label.sizeToFit()
        label.text = "Pie slice"
        label.isUserInteractionEnabled = true
        return label
    }()
    var pairingItemPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .systemGray
        label.sizeToFit()
        label.text = "$2.50"
        label.isUserInteractionEnabled = true
        return label
    }()
    
    var pairingItemIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "foods_pie")
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    func setUpUI() {
        
            addSubview(randomStackView)
            randomStackView.addArrangedSubview(pairingItemIconImageView)
            randomStackView.addArrangedSubview(pairingItemTitleLabel)
            randomStackView.addArrangedSubview(pairingItemPriceLabel)

            NSLayoutConstraint.activate([
            randomStackView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            randomStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            randomStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            randomStackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1),
            randomStackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1)
            ])
    }
    


}
