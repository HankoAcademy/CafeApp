//
//  MenuItemViewController.swift
//  CafeApp
//
//  Created by Han  on 9/17/21.
//

import UIKit

protocol NewMenuItemViewable: AnyObject {
    func displayNewMenuItemDetails(_ menuItem: MenuItem)
}

class MenuItemViewController: UIViewController, NewMenuItemViewable {

    let menuItemSelected: MenuItem
    
    init(menuItemSelected: MenuItem) {
        self.menuItemSelected = menuItemSelected
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = MenuItemDetailView(menuItem: menuItemSelected, newMenuItemViewable: self)
                
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = menuItemSelected.name
    }
    
    func displayNewMenuItemDetails(_ menuItem: MenuItem) {
        
        navigationController?.pushViewController(MenuItemViewController(menuItemSelected: menuItem), animated: true)
    }
}
