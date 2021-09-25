//
//  CafeLogoView.swift
//  CafeApp
//
//  Created by Christian on 9/22/21.
//

import Foundation
import UIKit

class CafeLogoView: UIStackView {

    // MARK: - UI Properties

    let headerImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo_coffee")
        image.image?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .white
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let headerLabelView: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textColor = .darkGray
        label.textAlignment = .center
        label.text = "Hanko Cafe"
        return label
    }()

    // MARK - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        setUpUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        axis = .horizontal
        spacing = 20
        distribution = .fillProportionally
        
        addHeaderImage()
        addHeaderLabel()
    }
    
    private func addHeaderImage() {
        addArrangedSubview(headerImageView)
        
        NSLayoutConstraint.activate([
            headerImageView.heightAnchor.constraint(equalToConstant: 90),
            headerImageView.widthAnchor.constraint(equalTo: headerImageView.heightAnchor)
        ])
    }
    
    private func addHeaderLabel() {
        addArrangedSubview(headerLabelView)
    }
    
}


