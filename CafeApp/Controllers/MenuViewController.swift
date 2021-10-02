//
//  MenuViewController.swift
//  CafeApp
//
//  Created by Hannie Kim on 9/12/21.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ActionButtons {
    
    // You got this! Let us know if you have questions or want feedback about your code 🙂
    
    // MARK: - Properties
    
    private var menu: Menu
    private var menuItems: [MenuItems] = MenuItems.allCases
        
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
    
//    override func loadView() {
//        //super.loadView()
//
//
//
//
//
//        setUpUI()
//    }
    
    init(withMenu menu: Menu) {
            self.menu = menu
            
            super.init(nibName: nil, bundle: nil)
        
            // menuTableHeaderView = MenuTableHeaderView(actionButtons: self, reuseIdentifier: "MenuTableHeaderView")
        
            view.backgroundColor = .white
        
            tableView.delegate = self
            tableView.dataSource = self
        
            view = MenuItemView()
        
            //setUpUI()
        }
        
        required init?(coder: NSCoder) {
            self.menu = Menu() //default menu
            
            super.init(coder: coder)
            
            // menuTableHeaderView = MenuTableHeaderView(actionButtons: self, reuseIdentifier: "MenuTableHeaderView")
        
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
    
    func filter() {
        print("Filter button Pressed")
    }
}
