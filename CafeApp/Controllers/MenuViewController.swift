//
//  MenuViewController.swift
//  CafeApp
//
//  Created by Hannie Kim on 9/12/21.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let menu = Menu()
    
    // MARK: - UI Properties
    
    private var contentView: ContentView! //??? in SLACK - Why need '!', w/out says no initializers
    private var tableView: UITableView!
    
    
    // MARK: - Lifecycle Methods
    
    override func loadView() {
        
        contentView = ContentView()
        view = contentView
        
        tableView = contentView.tableView
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - UITableViewDelegate
        // (tip just type out 'tableView' to see all available delegates)
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {  // difficulty understanding switch value
        case 0:
            let drink = menu.drinks[indexPath.row]
            print("Selected a \(drink.name) that costs \(drink.price)")
        case 1:
            let food = menu.foods[indexPath.row]
            print("Selected a \(food.name) that costs \(food.price)")
        case 2:
            let miscItem = menu.merchAndOthers[indexPath.row]
            print("Selected a \(miscItem.name) that costs \(miscItem.price)")
        default:
            return        }
    }
    
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Drinks"
        case 1:
            return "Food"
        case 2:
            return "Merch and Other Stuff"
        default:
            return nil
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemDetailTableViewCell", for: indexPath) as? MenuItemDetailTableViewCell else {
                return UITableViewCell()
        }
        
        var menuItem: MenuItem? //menuItem is optional type
        
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
        
        // if menuItem != nil, unwrap to make non-optional
        if let menuItem = menuItem {
            cell.updateMenu(menuItemTitle: menuItem.name, menuItemPrice: menuItem.price, menuItemImage: menuItem.imageName, menuItemDescription: menuItem.description)
        }
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MenuHeaderView") as? MenuTableHeaderView else {
//            return nil
//        }
//    }
//    
//    switch section {
//    case 0:
//        headerView.headerName = "Drinks"
//    case 1:
//        headerView.headerName = "Food"
//    case 2:
//        headerView.headerName = "Merch + Other"
//    default:
//        headerView.headerName = "Other"
//    }
    
}
