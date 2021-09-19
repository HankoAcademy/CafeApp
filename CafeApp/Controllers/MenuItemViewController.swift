//
//  MenuItemViewController.swift
//  CafeApp
//
//  Created by Han  on 9/17/21.
//

import UIKit

class MenuItemViewController: UIViewController {

    override func loadView() {
        view = MenuItemDetailView()
        
        navigationItem.title = "Menu Item"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
