//
//  myTableViewCell.swift
//  CafeApp
//
//  Created by Victoria Park on 9/16/21.
//

import UIKit

class ItemCell: UITableViewCell {
   
    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.alignment = .center
        stack.backgroundColor = UIColor(named:"cream")
        return stack
    }()
    let productImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
    //    imageView.clipsToBounds = true
        return imageView
    }()
    private let descriptionStack:UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .leading
        return stack
    }()
    let descriptionLabel : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .gray
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    let nameLabel : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16,weight: .bold)
        lbl.textAlignment = .left
      //  lbl.numberOfLines = 0
        return lbl
    }()
    let priceLabel : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 18,weight:.semibold)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpUI()
     }
  
    private func setUpUI(){
     
        self.contentView.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: self.topAnchor),
            stack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            stack.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        stack.addArrangedSubview(productImage)
        NSLayoutConstraint.activate([
            productImage.widthAnchor.constraint(equalToConstant: 50),
            
        
            priceLabel.widthAnchor.constraint(equalToConstant: 70)
        ])
        stack.addArrangedSubview(descriptionStack)
      
        stack.addArrangedSubview(priceLabel)
        descriptionStack.addArrangedSubview(nameLabel)
        descriptionStack.addArrangedSubview(descriptionLabel)
        
    }

}
    
/*
Mayuko's implementation -> left this for
 reference. Mayuko's constraints are better as they
 allow for price label to increase in size. I chose fixed sizes for the price label and image allowing
 description stack to fill up the rest of the space
 in the horizontal stackview
 
    
 var imageName: String = "" {
     didSet {
         productImage.image = UIImage(named: imageName)
     }
 }
 
 var itemName: String = "" {
     didSet {
         nameLabel.text = itemName
     }
 }
 
 var itemDescription: String = "" {
     didSet {
         descriptionLabel.text = itemDescription
     }
 }
 
 var itemPrice: Double = 0 {
     didSet {
         priceLabel.text = String(format: "$%.02f", itemPrice)
     }
 }
    
 
// MARK: - UI Component Declarations
 
 private let leftSideInfoStackView: UIStackView = {
     let stackView = UIStackView()
     stackView.axis = .horizontal
     stackView.alignment = .leading
     stackView.distribution = .fillProportionally
     stackView.spacing = 12
     stackView.translatesAutoresizingMaskIntoConstraints = false
     return stackView
 }()
 
let productImage: UIImageView = {
     let imageView = UIImageView()
     imageView.contentMode = .scaleAspectFit
     imageView.translatesAutoresizingMaskIntoConstraints = false
     return imageView
 }()
 
private let textStackView: UIStackView = {
     let stackView = UIStackView()
     stackView.axis = .vertical
     stackView.alignment = .leading
     stackView.distribution = .fillProportionally
     stackView.translatesAutoresizingMaskIntoConstraints = false
     return stackView
 }()
 
 let nameLabel: UILabel = {
     let label = UILabel()
     label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
     label.textColor = .black
     label.textAlignment = .left
     label.translatesAutoresizingMaskIntoConstraints = false
     return label
 }()
 
let descriptionLabel: UILabel = {
     let label = UILabel()
     label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
     label.textColor = .lightGray
     label.textAlignment = .left
     label.translatesAutoresizingMaskIntoConstraints = false
     label.lineBreakMode = .byTruncatingTail
     return label
 }()
 
  let priceLabel: UILabel = {
     let label = UILabel()
     label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
     label.textColor = .black
     label.textAlignment = .right
     label.translatesAutoresizingMaskIntoConstraints = false
     return label
 }()
 
// MARK: - Initializers
 override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
     super.init(style: style, reuseIdentifier: reuseIdentifier)
     
     setupUI()
     activateConstraints()
 }
 
 required init?(coder: NSCoder) {
     super.init(coder: coder)
     
     setupUI()
     activateConstraints()
 }
// MARK: - UI Configuration
 private func setupUI() {
     contentView.backgroundColor = UIColor(named: "Cream")
     
     textStackView.addArrangedSubview(nameLabel)
     textStackView.addArrangedSubview(descriptionLabel)
     
     leftSideInfoStackView.addArrangedSubview(productImage)
     leftSideInfoStackView.addArrangedSubview(textStackView)
     
     contentView.addSubview(leftSideInfoStackView)
     contentView.addSubview(priceLabel)
 }
 
 private func activateConstraints() {
     NSLayoutConstraint.activate([
         productImage.widthAnchor.constraint(equalToConstant: 30),
         
         leftSideInfoStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
         leftSideInfoStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
         leftSideInfoStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
         
         leftSideInfoStackView.trailingAnchor.constraint(equalTo: priceLabel.leadingAnchor, constant: -8),
         
         priceLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
         priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
     ])
     
     priceLabel.setContentHuggingPriority(.required, for: .horizontal)
     priceLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
 }
}

 */
