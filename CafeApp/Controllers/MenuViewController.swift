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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
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
            cell.update(menuItemImage: menuItem.imageName, menuItemName: menuItem.name, menuItemDescription: menuItem.description, menuItemPrice: menuItem.price)
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
        case 2:
            return menu.merchAndOthers.count
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            let drink = menu.drinks[indexPath.row]
            print("Selected a \(drink.name) that costs \(drink.price)")
        case 1:
            let food = menu.foods[indexPath.row]
            print("Selected a \(food.name) that costs \(food.price)")
        case 2:
            let merch = menu.merchAndOthers[indexPath.row]
            print("Selected a \(merch.name) that costs \(merch.price)")
        default:
            return
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MenuTableHeaderView") as? MenuTableHeaderView else {
            return nil
        }
        
        switch section {
        case 0:
            headerView.headerTitle = "Drinks"
        case 1:
            headerView.headerTitle = "Food"
        case 2:
            headerView.headerTitle = "Merch • Other"
        default:
            return nil
        }
        
        return headerView
    }
}
