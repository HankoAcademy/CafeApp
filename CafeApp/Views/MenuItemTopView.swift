//
//  MenuItemTopView.swift
//  CafeApp
//
//  Created by Victoria Park on 9/29/21.
//

import UIKit

class MenuItemTopView: UIView {
    
    
 // MARK: - Class Properties
    
    let menuItem:MenuItem
    
 // MARK: - UI Component Declarations
    
    let brownImageBackingView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named:"mocha")
    //    view.layer.cornerRadius = view.frame.height/2
        return view
    }()
    lazy var mainItemImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: menuItem.imageName)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    lazy var priceLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = String(format: "$%.02f", menuItem.price)
        label.backgroundColor = UIColor(named:"lightBrown")
        label.layer.cornerRadius = 15
        label.clipsToBounds = true
        return label
    }()
    
    // MARK: Initializers
    
    init(menuItem:MenuItem){
        self.menuItem = menuItem
        super.init(frame:.zero)
    }
    required init?(coder:NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup Functions
    override func layoutSubviews() {
        setUpViews()
    }
    private func setUpViews(){
        self.addSubview(brownImageBackingView)
        brownImageBackingView.addSubview(mainItemImageView)
        self.addSubview(priceLabel)
        
        NSLayoutConstraint.activate([
            brownImageBackingView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            brownImageBackingView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            brownImageBackingView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8),
            brownImageBackingView.widthAnchor.constraint(equalTo: brownImageBackingView.heightAnchor)
            
        ])
       self.layoutIfNeeded()
        
        brownImageBackingView.layer.cornerRadius = brownImageBackingView.frame.height/2
        
        NSLayoutConstraint.activate([
            mainItemImageView.centerXAnchor.constraint(equalTo: brownImageBackingView.centerXAnchor),
            mainItemImageView.centerYAnchor.constraint(equalTo: brownImageBackingView.centerYAnchor),
            mainItemImageView.heightAnchor.constraint(equalTo: brownImageBackingView.heightAnchor, multiplier: 0.6),
            mainItemImageView.widthAnchor.constraint(equalTo: mainItemImageView.heightAnchor)
        ])
     
        self.layoutIfNeeded()
        mainItemImageView.layer.cornerRadius = mainItemImageView.frame.height/2
        
         NSLayoutConstraint.activate([
             priceLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
             priceLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
             priceLabel.widthAnchor.constraint(equalToConstant: 80),
             priceLabel.heightAnchor.constraint(equalToConstant: 40)
         ])
    
         self.layoutIfNeeded()
         
    }
    
}
