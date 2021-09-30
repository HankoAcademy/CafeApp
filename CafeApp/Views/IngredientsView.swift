//
//  IngredientsView.swift
//  CafeApp
//
//  Created by Victoria Park on 9/30/21.
//

import UIKit

class IngredientsView: UIView {

    let ingredientsRoundedView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named:"cream")
        return view
    }()
    let ingredientsTopLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
         let attributedString = NSMutableAttributedString(string: "Ingredients")
         attributedString.addAttribute(NSAttributedString.Key.kern, value: 8, range: NSRange(location: 0, length: attributedString.length))
         label.attributedText = attributedString
        label.textAlignment = .center
        return label
    }()
    let ingredientsLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
   
    override init(frame:CGRect){
        super.init(frame:frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        setUpViews()
    }
    private func setUpViews(){
        
         self.addSubview(ingredientsRoundedView)
         ingredientsRoundedView.addSubview(ingredientsTopLabel)
         ingredientsRoundedView.addSubview(ingredientsLabel)
        
         
         NSLayoutConstraint.activate([
             ingredientsRoundedView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7),
             ingredientsRoundedView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8),
             ingredientsRoundedView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
             ingredientsRoundedView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
         ])
         
          self.layoutIfNeeded()
          ingredientsRoundedView.layer.cornerRadius = ingredientsRoundedView.frame.width/10
          NSLayoutConstraint.activate([
              ingredientsTopLabel.widthAnchor.constraint(equalTo: ingredientsRoundedView.widthAnchor, multiplier: 0.7),
              ingredientsTopLabel.topAnchor.constraint(equalTo: ingredientsRoundedView.topAnchor, constant: 10),
              ingredientsTopLabel.heightAnchor.constraint(equalTo:ingredientsRoundedView.heightAnchor, multiplier: 0.4),
              ingredientsTopLabel.centerXAnchor.constraint(equalTo: ingredientsRoundedView.centerXAnchor)
          ])
         
          NSLayoutConstraint.activate([
              ingredientsLabel.leadingAnchor.constraint(equalTo: ingredientsRoundedView.leadingAnchor, constant:20),
              ingredientsLabel.bottomAnchor.constraint(equalTo: ingredientsRoundedView.bottomAnchor, constant: -20)
          ])
          ingredientsLabel.text = "very fine ingredients"
          self.layoutIfNeeded()
        
    }
}

