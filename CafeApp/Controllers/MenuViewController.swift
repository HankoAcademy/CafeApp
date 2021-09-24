//
//  MenuViewController.swift
//  CafeApp
//
//  Created by Hannie Kim on 9/12/21.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // You got this! Let us know if you have questions or want feedback about your code 🙂
    
    private let menu = Menu()
    
    // MARK: - Properties
    
    private var contentView: ContentView!
    
    private var tableView: UITableView!
    
    // MARK: - Initializers
    
    override func loadView() {
        contentView = ContentView()
        
        view = contentView
        
        tableView = contentView.tableView
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK - UITableView Delegate
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContentViewTableCell", for: indexPath) as? ContentViewTableCell else {
            return UITableViewCell()
        }
        
        var menuItem: MenuItem?
        
        switch indexPath.section {
        case 0:
            menuItem = menu.drinks[indexPath.row]
        case 1:
            menuItem = menu.foods[indexPath.row]
        case 2:
            menuItem = menu.merchAndOthers[indexPath.row]
        default:
            return UITableViewCell()
        }
        
        if let menuItem = menuItem {
            cell.update(menuItemImage: menuItem.imageName, menuItemPrice: menuItem.price)
        }
        
        return cell
    }
    
    // MARK - UITableView Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return menu.drinks.count
        case 1:
            return menu.foods.count
        case 3:
            return menu.merchAndOthers.count
        default:
            return 1
        }
    }
}
