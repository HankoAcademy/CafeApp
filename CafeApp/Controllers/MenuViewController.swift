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
    private let menu = Menu()
    
    var hideDrinkSection = false
    var hideFoodSection = false
    var hideMerchSection = false
    
    // MARK: - UI Properties
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
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(section == 0){
            return self.menu.drinks.count
        } else if(section == 1){
            return self.menu.foods.count
        } else if(section == 2){
            return self.menu.merchAndOthers.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemCell", for: indexPath ) as! MenuItemView
        
        var menuItem: MenuItem?
        
        if(indexPath.section == 0) {
            menuItem = menu.drinks[indexPath.row]
        }else if(indexPath.section == 1) {
            menuItem = menu.foods[indexPath.row]
        }else if(indexPath.section == 2) {
            menuItem = menu.merchAndOthers[indexPath.row]
        }
        
        if let menuItem = menuItem {
            cell.imageName = menuItem.imageName
            cell.itemName = menuItem.name
            cell.itemDescription = menuItem.description
            cell.itemPrice = menuItem.price
            
        }
        
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            if hideDrinkSection {
                return 0
            }
            else {
                return UITableView.automaticDimension
            }
        case 1:
            if hideFoodSection {
                return 0
            }
            else {
                return UITableView.automaticDimension
            }
        case 2:
            if hideMerchSection {
                return 0
            }
            else {
                return UITableView.automaticDimension
            }
        default:
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MenuHeaderView") as? TableHeaderView else {
            return nil
        }
        
        switch section {
        case 0:
            headerView.headerName = "Drinks"
        case 1:
            headerView.headerName = "Food"
        case 2:
            headerView.headerName = "Merch and Other"
        default:
            headerView.headerName = "Other"
        }
        
        return headerView
    }
}
