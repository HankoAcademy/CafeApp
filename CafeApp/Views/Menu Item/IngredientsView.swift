//
//  IngredientsView.swift
//  CafeApp
//
//  Created by Hannie Kim on 9/17/21.
//

import UIKit

class IngredientsView: UIStackView {
    
// MARK: - Class Properties
    
    let descriptionContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let attributedString = NSMutableAttributedString(string: "ingredients")
        attributedString.addAttribute(NSAttributedString.Key.kern, value: 14, range: NSRange(location: 0, length: attributedString.length))
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 12, weight: .regular), range: NSRange(location: 0, length: attributedString.length))
        label.attributedText = attributedString
        label.textAlignment = .center
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.textAlignment = .left
        return label
    }()
    
// MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(named: "Cream")
        
        axis = .vertical
        distribution = .fillProportionally
        spacing = 8
        
        layer.cornerRadius = 20
        
        setUpViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - UI Setup Functions
    
    private func setUpViews() {
        
        descriptionContainer.addSubview(descriptionLabel)
        addArrangedSubview(titleLabel)
        addArrangedSubview(descriptionContainer)
        
        // FIXME: Redo subviews or constraints to be closer to design 
        
        NSLayoutConstraint.activate([
            
            titleLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/2),
            
            descriptionLabel.topAnchor.constraint(equalTo: descriptionContainer.topAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: descriptionContainer.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: descriptionContainer.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: descriptionContainer.bottomAnchor, constant: -10)
        ])
    }
}
