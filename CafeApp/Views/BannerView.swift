//
//  BannerView.swift
//  CafeApp
//
//  Created by Victoria Park on 9/16/21.
//

import UIKit

class BannerView: UIView {

    let logoImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        imageView.image = UIImage(named:"logo_coffee")
        return imageView
    }()
    
    let titleLabel:UILabel = {
        let label = UILabel()
        label.text = "Hanko Cafe"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    let bannerStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = 15
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        print("banner view being laid out")
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    private func setUpUI(){
        self.backgroundColor = .clear
        self.addSubview(bannerStackView)
        
        
        NSLayoutConstraint.activate([
           
            bannerStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            bannerStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        bannerStackView.addArrangedSubview(logoImageView)
        bannerStackView.addArrangedSubview(titleLabel)
       
        
        
        
       
        
    }
}
