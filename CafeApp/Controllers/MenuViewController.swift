//
//  MenuViewController.swift
//  CafeApp
//
//  Created by Hannie Kim on 9/12/21.
//  Edited by Sotiri Kolvani
//

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
       // MARK: - Class Properties
       
       private let menu = Menu()
       
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
       
       // MARK: - UITableViewDelegate
       
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           switch indexPath.section {
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
               return
           }
       }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
           
           guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ProductTableHeaderView") as? ProductTableHeaderView else {
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
               headerView.headerTitle = "Other"
           }
           
           return headerView
       }

       // MARK: - UITableViewDataSource
       
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
           
           guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductDetailTableViewCell", for: indexPath) as? ProductDetailTableViewCell else {
               return UITableViewCell()
           }
           
           var product: MenuItem?
           
           switch indexPath.section {
           case 0:
               product = menu.drinks[indexPath.row]
           case 1:
               product = menu.foods[indexPath.row]
           case 2:
               product = menu.merchAndOthers[indexPath.row]
           default:
               return UITableViewCell()
           }
           
           if let product = product {
            cell.update(itemTitle: product.name, itemPrice: product.price, itemImage: product.imageName, itemDescription: product.description)
           }
           
           return cell
       }

    
} // End of Controller Class



/* ***************************  Displaying a title in Header per section ********************************************
 
func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    switch section {
    case 0:
         return "Drinks"
    case 1:
         return "Food"
    case 2:
         return "Merch & Others"
    default:
        return nil
    }
}
*/
