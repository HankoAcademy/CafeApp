//
//  MenuHeaderView.swift
//  CafeApp
//
//  Created by Raul Rodriguez III on 9/23/21.
//

import Foundation
import UIKit

class MenuHeaderView: UIView {
     
    // MARK: - UI Declarations
    
    let headerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    let headerImageView: UIImageView = {
        let headerImage = UIImageView(image: UIImage(named: "logo_coffee"))
        headerImage.translatesAutoresizingMaskIntoConstraints = false
        return headerImage
    }()
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        label.textAlignment = .center
        label.text = "Café Amigo"
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    
    private func setUpUI(){
        
        headerStackView.addArrangedSubview(headerImageView)
        headerStackView.addArrangedSubview(headerLabel)
        addSubview(headerStackView)
        
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            headerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            headerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            
            headerImageView.widthAnchor.constraint(equalToConstant: 100),
            headerImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
