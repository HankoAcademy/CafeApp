//
//  MenuHeaderView.swift
//  CafeApp
//
//  Created by Mayuko Inoue on 9/9/21.
//

import UIKit

class MenuHeaderView: UIView {

// MARK: - UI Component Declarations
    
    let headerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    let coffeeImageView: UIImageView = {
        let coffeeImage = UIImageView(image: UIImage(named: "logo_coffee"))
        coffeeImage.translatesAutoresizingMaskIntoConstraints = false
        return coffeeImage
    }()

    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Hanko Cafe"
        label.font = UIFont.systemFont(ofSize: 40, weight: .medium)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
// MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        activateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - UI Setup Functions

    private func setupUI() {
        headerStackView.addArrangedSubview(coffeeImageView)
        headerStackView.addArrangedSubview(headerLabel)
        addSubview(headerStackView)
    }
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: topAnchor),
            headerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            headerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            coffeeImageView.widthAnchor.constraint(equalToConstant: 115),
            coffeeImageView.heightAnchor.constraint(equalToConstant: 106),
        ])
    }
}
