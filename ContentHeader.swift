//
//  ContentHeader.swift
//  CafeApp
//
//  Created by Yunseo Lee on 9/28/21.
//

import UIKit

class ContentHeader: UIView {
    
    // MARK: - UI Properties
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private var logoImageView: UIImageView = {
        let logoImage = UIImageView(image: UIImage(named: "logo_coffee"))
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        return logoImage
    }()
    
    private var logoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        label.text = "HANKOFEE"
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect){
        super.init(frame: frame)
        
        SetupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    
    func SetupUI(){
        addSubview(stackView)
        stackView.addArrangedSubview(logoImageView)
        stackView.addArrangedSubview(logoLabel)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),

            logoImageView.widthAnchor.constraint(equalToConstant: 115),
            logoImageView.heightAnchor.constraint(equalToConstant: 106),
        ])
    }
    
    
}
