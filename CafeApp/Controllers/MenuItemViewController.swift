//
//  MenuItemViewController.swift
//  CafeApp
//
//  Created by Han  on 9/17/21.
//

import UIKit

class MenuItemViewController: UIViewController {

    let menuItemSelected: MenuItem
    
    init(menuItemSelected: MenuItem) {
        self.menuItemSelected = menuItemSelected
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = MenuItemDetailView(menuItem: menuItemSelected)
                
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = menuItemSelected.name
    }
}
