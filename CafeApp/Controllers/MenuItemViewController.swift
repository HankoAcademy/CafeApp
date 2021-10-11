//
//  MenuItemViewController.swift
//  CafeApp
//
//  Created by Christian on 10/3/21.
//

import Foundation
import UIKit

protocol NewMenuItem: AnyObject {
    func displayNewMenuItemView(_ menuItem: MenuItem)
}

class MenuItemViewController: UIViewController, NewMenuItem {
    
    // MARK: - Properties
    
    private var menuItem: MenuItem
    
    // MARK: - View Lifecyle
    
    init(withMenuItem menuItem: MenuItem) {
            self.menuItem = menuItem
            
            super.init(nibName: nil, bundle: nil)
                
            view.backgroundColor = .white
        }
        
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    override func loadView() {
        view = MenuItemView(withMenuItem: menuItem, newMenuItem: self)
        navigationItem.title = menuItem.name
        navigationController?.navigationBar.barTintColor = UIColor(named: "cream")
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - Delegate Method
    
    func displayNewMenuItemView(_ menuItem: MenuItem) {
        navigationController?.pushViewController(MenuItemViewController(withMenuItem: menuItem), animated: true)
    }
}
