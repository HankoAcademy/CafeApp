//
//  MenuViewController.swift
//  CafeApp
//
//  Created by Hannie Kim on 9/12/21.
//

import UIKit

protocol Sortable: AnyObject {
    func sort()
}

protocol Filterable: AnyObject {
    func filter()
}

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // You got this! Let us know if you have questions or want feedback about your code 🙂
    
    // MARK: - Properties
    
    private var menu: Menu
    private var menuItems: [MenuItems] = MenuItems.allCases
    
    var hideDrinks = false
    var hideFood = false
    var hideMerch = false
        
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(named: "cream")
        tableView.register(ContentViewTableCell.self, forCellReuseIdentifier: "ContentViewTableCell")
        tableView.register(MenuTableHeaderView.self, forHeaderFooterViewReuseIdentifier: "MenuTableHeaderView")
        tableView.layer.cornerRadius = 25
        return tableView
    }()
    
    let cafeLogoView: CafeLogoView = {
        let cafeLogoView = CafeLogoView()
        cafeLogoView.translatesAutoresizingMaskIntoConstraints = false
        return cafeLogoView
    }()
    
    var menuTableHeaderView: MenuTableHeaderView!
    
    
    // MARK: - View Lifecyle
    
    init(withMenu menu: Menu) {
            self.menu = menu
            
            super.init(nibName: nil, bundle: nil)
                
            view.backgroundColor = .white
        
            tableView.delegate = self
            tableView.dataSource = self
        
            setUpUI()
        }
        
        required init?(coder: NSCoder) {
            self.menu = Menu() //default menu
            
            super.init(coder: coder)
                    
            view.backgroundColor = .white
        
            tableView.delegate = self
            tableView.dataSource = self
            
            setUpUI()
            
        }
    
    // MARK: - Set Up UI
    
    func setUpUI() {
        
        addLogoStackView()
        addTableView()
    }
    
    private func addLogoStackView() {
        view.addSubview(cafeLogoView)
        
        NSLayoutConstraint.activate([
            cafeLogoView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            cafeLogoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            cafeLogoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
    
    private func addTableView() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: cafeLogoView.bottomAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
        
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
            cell.imageName = menuItem.imageName
            cell.price = menuItem.price
            cell.itemName = menuItem.name
            cell.itemDescription = menuItem.description
        }
        
        return cell
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            if hideDrinks {
                return 0
            }
            return menu.drinks.count
        case 1:
            if hideFood {
                return 0
            }
            return menu.foods.count
        case 2:
            if hideMerch {
                return 0
            }
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
        
        headerView.sortableDelegate = self
        headerView.filterableDelegate = self
        
        switch section {
        case 0:
            headerView.hideActions = false
            headerView.headerTitle = "Drinks"
        case 1:
            headerView.hideActions = true
            headerView.headerTitle = "Food"
        case 2:
            headerView.hideActions = true
            headerView.headerTitle = "Merch • Other"
        default:
            return nil
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            if hideDrinks {
                return 0
            }
            else {
                return UITableView.automaticDimension
            }
        case 1:
            if hideFood {
                return 0
            }
            else {
                return UITableView.automaticDimension
            }
        case 2:
            if hideMerch {
                return 0
            }
            else {
                return UITableView.automaticDimension
            }
        default:
            return UITableView.automaticDimension
        }
    }
}
    
    extension MenuViewController: Sortable {
        func sort() {
            let alertController = UIAlertController(title: "", message: "Sort by:", preferredStyle: .actionSheet)
            alertController.addAction(UIAlertAction(title: "Name", style: .default, handler: { _ in
               self.menu.drinks = self.menu.sortDrinksByName()
               self.menu.foods = self.menu.sortFoodsByName()
               self.menu.merchAndOthers = self.menu.sortMerchByName()
               self.tableView.reloadData()
            }))
            alertController.addAction(UIAlertAction(title: "Price", style: .default, handler: { _ in
               self.menu.drinks = self.menu.sortDrinksByPrice()
               self.menu.foods = self.menu.sortFoodsByPrice()
               self.menu.merchAndOthers = self.menu.sortMerchByPrice()
               self.tableView.reloadData()
            }))
            present(alertController, animated: true, completion: nil)
        }
    }

extension MenuViewController: Filterable {
    func filter() {
        let alertController = UIAlertController(title: "", message: "Filter", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Drinks", style: .default, handler: { _ in
            self.hideDrinks = false
            self.hideFood = true
            self.hideMerch = true
           self.tableView.reloadData()
        }))
        alertController.addAction(UIAlertAction(title: "Food", style: .default, handler: { _ in
            self.hideFood = false
            self.hideDrinks = true
            self.hideMerch = true
            self.tableView.reloadData()
        }))
        alertController.addAction(UIAlertAction(title: "Merch • Other", style: .default, handler: { _ in
            self.hideMerch = false
            self.hideDrinks = true
            self.hideFood = true
            self.tableView.reloadData()
        }))
        present(alertController, animated: true, completion: nil)
    }
}
