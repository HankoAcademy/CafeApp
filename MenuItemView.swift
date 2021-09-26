//
//  ProductDetailTableViewCell.swift
//  CafeApp
//
//  Created by Yunseo Lee on 9/19/21.
//

import UIKit

class MenuItemView: UITableViewCell {

    // MARK: - UI Properties
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI(){
        
        
    }
}
