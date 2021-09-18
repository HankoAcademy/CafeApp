//
//  MenuItemDetailView.swift
//  CafeApp
//
//  Created by Han  on 9/17/21.
//

import UIKit

class MenuItemDetailView: UIView {
    
    let menuItemWithPriceView: UIView = {
        let menuItemWithPriceView = MenuItemWithPriceView()
        menuItemWithPriceView.translatesAutoresizingMaskIntoConstraints = false
        return menuItemWithPriceView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews() {
        
        
    }
}
