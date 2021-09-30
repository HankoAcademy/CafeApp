//
//  MyCustomHeader.swift
//  CafeApp
//
//  Created by Diana Ruiz-Olvera on 9/21/21.
//

import UIKit

class MyCustomHeader: UITableViewHeaderFooterView {
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor(named: "cream")
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "Header"
        label.sizeToFit()
        return label
    }()
    
    let divider: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray
        return view
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpUI() {
        
        contentView.backgroundColor = UIColor(named: "cream")
        contentView.sizeToFit()

        contentView.addSubview(headerLabel)

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),

            headerLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 18),
            headerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            headerLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            headerLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0)
        ])
        
        addDivider()
    }
    
    private func addDivider() {

        contentView.addSubview(divider)
        
        NSLayoutConstraint.activate([
            divider.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 12),
            divider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            divider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            divider.heightAnchor.constraint(equalToConstant: 1)
            ])
    }
}
