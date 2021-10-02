//
//  MenuTableHeaderView.swift
//  CafeApp
//
//  Created by Raul Rodriguez III on 9/24/21.
//

import Foundation
import UIKit


class MenuTableHeaderView: UITableViewHeaderFooterView {
    
    // menutableheader letter spacing w/kern
    var headerName: String = "" {
        didSet {
            let attributedString = NSMutableAttributedString(string: headerName)
            attributedString.addAttribute(NSAttributedString.Key.kern, value: 14, range: NSRange(location: 0, length: attributedString.length))
            headerLabel.attributedText = attributedString
        }
    }
    
    private var headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var bottomLineView: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: "navy")
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupUI()
        activateConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupUI()
        activateConstraints()
    }
    
    private func setupUI() {
        contentView.backgroundColor = .white
        contentView.addSubview(headerLabel)
        contentView.addSubview(bottomLineView)
    }
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            headerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            headerLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            headerLabel.bottomAnchor.constraint(equalTo: bottomLineView.topAnchor, constant: -16),
            
            bottomLineView.leadingAnchor.constraint(equalTo: headerLabel.leadingAnchor),
            bottomLineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bottomLineView.heightAnchor.constraint(equalToConstant: 1),
            bottomLineView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
