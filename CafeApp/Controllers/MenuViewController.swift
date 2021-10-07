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
    
    private var menu = Menu()
    private var productTypes: [ProductType] = ProductType.allCases
    
    var hideDrinksSection = false
    var hideFoodSection = false
    var hideMerchSection = false
    
    var item: MenuItem?
    
    // MARK: UI Properties
    private var contentView: ContentView!
    private var tableView: UITableView!
    private var menuItemDetailView: MenuItemDetailView!
    
    // MARK: - Lifecycle
    
    override func loadView() {
        contentView = ContentView(
            sortButtonAction: { [weak self] in self?.displaySortAlert()},
            filterButtonAction: { [weak self] in self?.displayFilterAlert()}
        )
        view = contentView
        
        tableView = contentView.tableView
        tableView.delegate = self
        tableView.dataSource = self
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
  
    // MARK: - UI TableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            let drink = self.menu.drinks[indexPath.row]
            print("Selected a \(drink.name) that costs \(drink.price)")
            self.navigationController?.pushViewController(MenuItemViewController(selectedItem: drink), animated: true)
        case 1:
            let food = self.menu.foods[indexPath.row]
            print("Selected a \(food.name) that costs \(food.price)")
            self.navigationController?.pushViewController(MenuItemViewController(selectedItem: food), animated: true)
        case 2:
            let merch = self.menu.merchAndOthers[indexPath.row]
            print("Selected \(merch.name) that costs \(merch.price)")
            self.navigationController?.pushViewController(MenuItemViewController(selectedItem: merch), animated: true)
        default:
            return
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
                
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier:
            "SectionHeader") as? MenuTableHeaderView else {
            return nil
        }
        switch section {
        case 0: headerView.headerTitle = "Drinks"
        case 1: headerView.headerTitle = "Food"
        case 2: headerView.headerTitle = "Merch · Other"
        default:
            return nil
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            if hideDrinksSection {return 0}
            else {return UITableView.automaticDimension}
        case 1:
            if hideFoodSection {return 0}
            else {return UITableView.automaticDimension}
        case 2:
            if hideMerchSection {return 0}
            else {return UITableView.automaticDimension}
        default:
            return UITableView.automaticDimension
        }
    }
    
    // MARK: UITableViewDataSource
      
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            if hideDrinksSection {return 0}
            return menu.drinks.count
        case 1:
            if hideFoodSection {return 0}
            return menu.foods.count
        case 2:
            if hideMerchSection {return 0}
            return menu.merchAndOthers.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemTableViewCell", for: indexPath) as? MenuItemTableViewCell else {
            return UITableViewCell()
        }
        var item: MenuItem?
        switch indexPath.section {
        case 0:
            item = self.menu.drinks[indexPath.row]
        case 1:
            item = self.menu.foods[indexPath.row]
        case 2:
            item = self.menu.merchAndOthers[indexPath.row]
        default:
            break
        }
        
        if let item = item {
            cell.update(itemIcon: item.imageName, itemTitle: item.name, itemDescription: item.description, itemPrice: item.price)
        }
        return cell
    }
    
    // MARK: - Sort Method
    
    func displaySortAlert() {
        let alertController = UIAlertController(title: "", message: "Select Sort Type", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Name", style: .default, handler: { _ in
            self.menu.drinks = self.menu.sortDrinksByName()
            self.menu.foods = self.menu.sortFoodsByName()
            self.menu.merchAndOthers = self.menu.sortMerchByName()
            self.tableView.reloadSections(IndexSet(integer: 0), with: .none)
        }))
        alertController.addAction(UIAlertAction(title: "Price", style: .default, handler: { _ in
            self.menu.drinks = self.menu.sortDrinksByPrice()
            self.menu.foods = self.menu.sortFoodsByPrice()
            self.menu.merchAndOthers = self.menu.sortMerchByPrice()
            self.tableView.reloadSections(IndexSet(integer: 0), with: .none)
        }))
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Filter Method
    
    func displayFilterAlert() {
        let alertController = UIAlertController(title: "", message: "Select Filter Type", preferredStyle: .actionSheet)
//      MARK: - PLAN A
//        alertController.addAction(UIAlertAction(title: "Drinks", style: .default, handler: { _ in
//            self.menu.drinks = Menu().drinks
//            self.menu.foods = []
//            self.menu.merchAndOthers = []
//            self.productTypes.append(ProductType.drinks)
//            self.tableView.reloadData()
//            self.productTypes.removeAll()
//        }))
//
//        alertController.addAction(UIAlertAction(title: "Food", style: .default, handler: { _ in
//            self.menu.foods = Menu().foods
//            self.menu.drinks = []
//            self.menu.merchAndOthers = []
//            self.productTypes.append(ProductType.foods)
//            self.tableView.reloadData()
//            self.productTypes.removeAll()
//        }))
//
//        alertController.addAction(UIAlertAction(title: "Merch", style: .default, handler: { _ in
//            self.menu.drinks = []
//            self.menu.foods = []
//            self.menu.merchAndOthers = Menu().merchAndOthers
//            self.productTypes.append(ProductType.merchAndOthers)
//            self.tableView.reloadData()
//            self.productTypes.removeAll()
//        }))
//
//      MARK: - PLAN B
        alertController.addAction(UIAlertAction(title: "Drinks", style: .default, handler: { [weak self] _ in
            print("Filter by drinks")
            self?.hideDrinksSection = false
            self?.hideFoodSection = true
            self?.hideMerchSection = true
            self?.tableView.reloadData()
        }))
        alertController.addAction(UIAlertAction(title: "Food", style: .default, handler: { [weak self] _ in
            print("Filter by food")
            self?.hideFoodSection = false
            self?.hideDrinksSection = true
            self?.hideMerchSection = true
            self?.tableView.reloadData()
        }))
        alertController.addAction(UIAlertAction(title: "Merch", style: .default, handler: { [weak self] _ in
            print("Filter by merch")
            self?.hideMerchSection = false
            self?.hideFoodSection = true
            self?.hideDrinksSection = true
            self?.tableView.reloadData()
        }))
        present(alertController, animated: true, completion: nil)
    }
}
