//
//  MenuViewController.swift
//  CafeApp
//
//  Created by Hannie Kim on 9/12/21.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var menu = Menu()

    // MARK: - UI Properties
    
    // == var contentView = ContentView()
    private var contentView: ContentView!
    private var tableView: UITableView!
    
    
    // MARK: - Lifecycle Methods
    
    override func loadView() {
        
        contentView = ContentView()
        view = contentView
        
        tableView = contentView.tableView
        tableView.delegate = self
        tableView.dataSource = self
        
        let sortButton = UIBarButtonItem(title: "Sort", style: .plain, target: self, action: #selector(sortButtonPressed))
        let filterButton = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(filterButtonPressed))
        
        navigationItem.rightBarButtonItems = [
            sortButton,
            filterButton
        ]
        
//        view.superview?.bringSubviewToFront(view)

    }
    
    // MARK: - UITableViewDelegate
        // (tip just type out 'tableView' to see all available delegates)
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {  // difficulty understanding switch value
        case 0:
            let drink = menu.drinks[indexPath.row]
            print("Selected a \(drink.name) that costs \(drink.price)")
            navigationController?.pushViewController(MenuItemViewController(menuItemSelected: menu.drinks[indexPath.row]), animated: true)
        case 1:
            let food = menu.foods[indexPath.row]
            print("Selected a \(food.name) that costs \(food.price)")
            navigationController?.pushViewController(MenuItemViewController(menuItemSelected: menu.foods[indexPath.row]), animated: true)
        case 2:
            let miscItem = menu.merchAndOthers[indexPath.row]
            print("Selected a \(miscItem.name) that costs \(miscItem.price)")
            navigationController?.pushViewController(MenuItemViewController(menuItemSelected: menu.merchAndOthers[indexPath.row]), animated: true)
        default:
            return        }
    }
    
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MenuHeaderView") as? MenuTableHeaderView else {
                return nil
            }

            switch section {
            case 0:
                headerView.headerName = "Drinks"
            case 1:
                headerView.headerName = "Food"
            case 2:
                headerView.headerName = "Merch • Other"
            default:
                headerView.headerName = "Other"
            }

            return headerView
        }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3 //FIX ME- hard coded
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
    
    // MARK:- ACTIONS
    
    @objc func sortButtonPressed(){
        print("Sort button pressed")
        
        let alertController = UIAlertController(title: "", message: "Select Sort Type", preferredStyle: .actionSheet)
                alertController.addAction(UIAlertAction(title: "Name", style: .default, handler: { [weak self] _ in
                    print("Sorting the menu by name")
                    if let sortedMenu = self?.menu.sortMenu(bySortType: .name) {
                        self?.menu = sortedMenu
                        self?.tableView.reloadData()
                    }
                }))
                alertController.addAction(UIAlertAction(title: "Price", style: .default, handler: { [weak self] _ in
                    print("Sorting the menu by price")
                    if let sortedMenu = self?.menu.sortMenu(bySortType: .price) {
                        self?.menu = sortedMenu
                        self?.tableView.reloadData()
                    }
                }))
                present(alertController, animated: true, completion: nil)
        

    }
    
    @objc func filterButtonPressed(){
        print("Filter button pressed")
        
    
    }
    
    
}
