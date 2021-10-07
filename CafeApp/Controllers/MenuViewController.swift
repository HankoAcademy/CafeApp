//
//  MenuViewController.swift
//  CafeApp
//
//  Created by Hannie Kim on 9/12/21.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var menu = Menu()
    private var productTypes: [ProductType] = ProductType.allCases

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

        navigationItem.title = "Menu"
        
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            let drink = menu.drinks[indexPath.row]
            print("Selected a \(drink.name) that costs \(drink.price)")
            navigationController?.pushViewController(MenuItemViewController(menuItemSelected: menu.drinks[indexPath.row]), animated: true)
        case 1:
            let food = menu.foods[indexPath.row]
            print("Selected a \(food.name) that costs \(food.price)")
            navigationController?.pushViewController(MenuItemViewController(menuItemSelected: menu.foods[indexPath.row]), animated: true)
        case 2:
            let merch = menu.merchAndOthers[indexPath.row]
            print("Selected a \(merch.name) that costs \(merch.price)")
            navigationController?.pushViewController(MenuItemViewController(menuItemSelected: menu.merchAndOthers[indexPath.row]), animated: true)
        case 3:
            let miscItem = menu.misc[indexPath.row]
            print("Selected a \(miscItem.name) that costs \(miscItem.price)")
            navigationController?.pushViewController(MenuItemViewController(menuItemSelected: menu.misc[indexPath.row]), animated: true)
        default:
            break        }
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
        return productTypes.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return menu.drinks.count
        case 1:
            return menu.foods.count
        case 2:
            return menu.merchAndOthers.count
        case 3:
            return menu.misc.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemDetailTableViewCell", for: indexPath) as? MenuItemDetailTableViewCell else {
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
        case 3:
            menuItem = menu.misc[indexPath.row]
        default:
            return UITableViewCell()
        }
        
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
        
        let alertController = UIAlertController(title: nil, message: "filter by:", preferredStyle: .actionSheet)
                
                let copyMenu = Menu()
                
                alertController.addAction(UIAlertAction(title: "Drinks", style: .default){ _ in
                    self.menu.drinks = copyMenu.drinks
                    self.menu.foods.removeAll()
                    self.menu.merchAndOthers.removeAll()
                    self.menu.misc.removeAll()
                    
//                    self.productTypes.remove(at: 1)
//                    self.productTypes.remove(at: 1)
//                    self.productTypes.remove(at: 1)
                    
                    self.tableView.reloadData()
                })
                alertController.addAction(UIAlertAction(title: "Food", style: .default){ _ in
  
                    self.menu.drinks.removeAll()
                    self.menu.foods = copyMenu.foods
                    self.menu.merchAndOthers.removeAll()
                    self.menu.misc.removeAll()
        
                    self.tableView.reloadData()
                })
                alertController.addAction(UIAlertAction(title: "Merch", style: .default){ _ in
                    self.menu.foods.removeAll()
                    self.menu.drinks.removeAll()
                    self.menu.merchAndOthers = copyMenu.merchAndOthers
                    self.menu.misc.removeAll()

                    self.tableView.reloadData()
                })
                alertController.addAction(UIAlertAction(title: "Misc", style: .default){ _ in
                    self.menu.foods.removeAll()
                    self.menu.drinks.removeAll()
                    self.menu.merchAndOthers.removeAll()
                    self.menu.misc = copyMenu.misc
                    
                    self.tableView.reloadData()
                })
        
                alertController.addAction(UIAlertAction(title: "Show All", style: .default){ _ in
                    self.menu.foods = copyMenu.foods
                    self.menu.drinks = copyMenu.drinks
                    self.menu.merchAndOthers = copyMenu.merchAndOthers
                    self.menu.misc = copyMenu.misc

                    self.tableView.reloadData()
                })
                present(alertController, animated: true, completion: nil)
    
}
}
