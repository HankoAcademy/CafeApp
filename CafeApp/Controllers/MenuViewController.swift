//
//  MenuViewController.swift
//  CafeApp
//
//  Created by Hannie Kim on 9/12/21.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // You got this! Let us know if you have questions or want feedback about your code 🙂
    
    // MARK: - Class Properties
    private let menuItems = Menu()
    
    // MARK: UI Properties
    private var contentView: ContentView!
    private var tableView: UITableView!
    
    // MARK: - Lifecycle
    override func loadView() {
        contentView = ContentView()
        view = contentView
        
        tableView = contentView.tableView
        tableView.delegate = self
        tableView.dataSource = self
        
    }
  
    // MARK: - UI TableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            let drink = menuItems.drinks[indexPath.row]
            print("Selected a \(drink.name) that costs \(drink.price)")
        case 1:
            let food = menuItems.foods[indexPath.row]
            print("Selected a \(food.name) that costs \(food.price)")
        case 2:
            let merch = menuItems.merchAndOthers[indexPath.row]
            print("Selected \(merch.name) that costs \(merch.price)")
        default:
            return
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                    "sectionHeader") as! MyCustomHeader
                switch section {
        case 0:
            view.headerLabel.text = "D  r  i  n  k  s"
            return view
        case 1:
            view.headerLabel.text = "F  o  o  d"
            return view
        case 2:
            view.headerLabel.text = "M  e  r  c  h   ·   O  t  h  e  r"
            return view
        default:
            return nil
        }
    }
    
    // MARK: UITableViewDataSource
      
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return menuItems.drinks.count
        case 1:
            return menuItems.foods.count
        case 2:
            return menuItems.merchAndOthers.count
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductDetailTableViewCell", for: indexPath) as? ProductDetailTableViewCell else {
            return UITableViewCell()
        }
        var item: MenuItem?
        switch indexPath.section {
        case 0:
            item = menuItems.drinks[indexPath.row]
        case 1:
            item = menuItems.foods[indexPath.row]
        case 2:
            item = menuItems.merchAndOthers[indexPath.row]
        default:
            return UITableViewCell()
        }
        
        if let item = item {
            cell.update(itemIcon: item.imageName, itemTitle: item.name, itemDescription: item.description, itemPrice: item.price)
        }
        return cell
    }
    
}
