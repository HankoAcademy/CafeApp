//
//  PairingsView.swift
//  CafeApp
//
//  Created by Victoria Park on 9/30/21.
//

import UIKit

class PairingsView: UIView {

    var pairingList: [MenuItem]
    weak var delegate:ShowNewItemDelegate?
    
    let pairingRoundedView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named:"lightBrown")
        return view
    }()
    
    let pairingsLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        let attributedString = NSMutableAttributedString(string: "pairings")
        attributedString.addAttribute(NSAttributedString.Key.kern, value: 8, range: NSRange(location: 0, length: attributedString.length))
        label.attributedText = attributedString
        
        return label
    }()
    let pairingsStack:UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.layer.cornerRadius = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = UIColor(named:"lightBrown")
        return stack
    }()
    lazy var button1: MenuItemButton = {
        let button = MenuItemButton(menuItem: pairingList[0], delegate: delegate)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        return button
    }()
    lazy var button2: MenuItemButton = {
        let button = MenuItemButton(menuItem: pairingList[1], delegate: delegate)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        return button
    }()
    lazy var button3: MenuItemButton = {
        let button = MenuItemButton(menuItem: pairingList[2], delegate: delegate)
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    
    // MARK: Initializers
    
    init(pairingList:[MenuItem], delegate:ShowNewItemDelegate?){
        self.pairingList = pairingList
        self.delegate = delegate
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setUpViews()
    }
    
    private func setUpViews(){
        
        
         self.addSubview(pairingRoundedView)
         pairingRoundedView.addSubview(pairingsLabel)
         pairingRoundedView.addSubview(pairingsStack)
         pairingsStack.addArrangedSubview(button1)
         pairingsStack.addArrangedSubview(button2)
         pairingsStack.addArrangedSubview(button3)
         
        
         NSLayoutConstraint.activate([
             pairingRoundedView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
             pairingRoundedView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.9),
             pairingRoundedView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
             pairingRoundedView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
         ])
         pairingRoundedView.layer.cornerRadius = pairingRoundedView.frame.width/10
         NSLayoutConstraint.activate([
             pairingsLabel.topAnchor.constraint(equalTo: pairingRoundedView.topAnchor),
             pairingsLabel.centerXAnchor.constraint(equalTo: pairingRoundedView.centerXAnchor),
             pairingsLabel.heightAnchor.constraint(equalTo: pairingRoundedView.heightAnchor, multiplier: 0.2)
         ])
         NSLayoutConstraint.activate([
             pairingsStack.topAnchor.constraint(equalTo: pairingsLabel.bottomAnchor, constant:15),
             pairingsStack.leadingAnchor.constraint(equalTo: pairingRoundedView.leadingAnchor, constant: 10),
             pairingsStack.trailingAnchor.constraint(equalTo: pairingRoundedView.trailingAnchor, constant: -10),
             pairingsStack.bottomAnchor.constraint(equalTo: pairingRoundedView.bottomAnchor, constant:-10)
         ])
         
    }
}
