//
//  MenuItemViewController.swift
//  CafeApp
//
//  Created by Diana Ruiz-Olvera on 10/4/21.
//

import Foundation
import UIKit

class MenuItemViewController: UIViewController {
    
    // MARK: UI Properties
    private var menu = Menu()
    private var menuItemDetailView: MenuItemDetailView!
    private var mainViewController: MenuViewController!
    
    private let selectedItem: MenuItem
    private var selectedRandomItem: MenuItem
    private var pairings: Array<MenuItem?> = []
    private var randomElement1: MenuItem
    private var randomElement2: MenuItem
    private var randomElement3: MenuItem
    
    // MARK: Lifecycle Methods
    
    override func loadView() {
        
        menuItemDetailView = MenuItemDetailView()
        mainViewController = MenuViewController()
        
        view = menuItemDetailView
        
        menuItemDetailView.itemTitleLabel.text = selectedItem.name
        menuItemDetailView.iconImageView.image = UIImage(named: selectedItem.imageName)
        menuItemDetailView.itemDescriptionLabel.text = selectedItem.description
        menuItemDetailView.itemPriceLabel.text = String(format: "$%.02f", selectedItem.price)
        menuItemDetailView.itemIngredientsLabel.text = selectedItem.ingredients
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.backgroundColor = UIColor(named: "white")
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = selectedItem.name
        let newPairings = getRandomPairings(selectedItem: selectedItem)
        let randomItem1 = newPairings[0]
        let randomItem2 = newPairings[1]
        let randomItem3 = newPairings[2]
        assignRandomPairings(randomItem: randomItem1!, indexPath: 0)
        assignRandomPairings(randomItem: randomItem2!, indexPath: 1)
        assignRandomPairings(randomItem: randomItem3!, indexPath: 2)

    }
    
    init(selectedItem: MenuItem) {
        self.selectedItem = selectedItem
        self.selectedRandomItem = selectedItem
        self.randomElement1 = selectedItem
        self.randomElement2 = selectedItem
        self.randomElement3 = selectedItem
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getRandomPairings(selectedItem: MenuItem) -> Array<MenuItem?>{
        switch selectedItem {
        case is Drink:
            pairings.removeAll()
            self.randomElement1 = menu.foods.randomElement()!
            self.randomElement2 = menu.foods.randomElement()!
            self.randomElement3 = menu.foods.randomElement()!
            
            pairings.append(randomElement1)
            while self.randomElement1.name == self.randomElement2.name {
                self.randomElement2 = menu.foods.randomElement()!
            }
            pairings.append(randomElement2)
            while self.randomElement1.name == self.randomElement3.name || self.randomElement2.name == self.randomElement3.name{
                self.randomElement3 = menu.foods.randomElement()!
            }
            pairings.append(randomElement3)
        case is Food:
            pairings.removeAll()
            self.randomElement1 = menu.drinks.randomElement()!
            self.randomElement2 = menu.drinks.randomElement()!
            self.randomElement3 = menu.drinks.randomElement()!
            
            pairings.append(randomElement1)
            while self.randomElement1.name == self.randomElement2.name {
                self.randomElement2 = menu.drinks.randomElement()!
            }
            pairings.append(randomElement2)
            while self.randomElement1.name == self.randomElement3.name || self.randomElement2.name == self.randomElement3.name{
                self.randomElement3 = menu.drinks.randomElement()!
            }
            pairings.append(randomElement3)
        case is Merch:
            pairings.removeAll()
            self.randomElement1 = menu.foods.randomElement()!
            self.randomElement2 = menu.drinks.randomElement()!
            self.randomElement3 = menu.drinks.randomElement()!
            
            pairings.append(self.randomElement1)
            pairings.append(self.randomElement2)
            while self.randomElement2.name == self.randomElement3.name {
                self.randomElement2 = menu.drinks.randomElement()!
            }
            pairings.append(randomElement3)
        default:
            print("What do I write here?")
        }
        return pairings
    }
    
    func assignRandomPairings(randomItem: MenuItem, indexPath: Int) {
        let tap = MyTapGesture(target: self, action: #selector(randomItemTapped(recognizer:)))
        switch indexPath {
        case 0:
            menuItemDetailView.randomStackView1.pairingItemIconImageView.image = UIImage(named: randomItem.imageName)
            menuItemDetailView.randomStackView1.pairingItemTitleLabel.text = randomItem.name
            menuItemDetailView.randomStackView1.pairingItemPriceLabel.text = String(format: "$%.02f", randomItem.price)
            menuItemDetailView.randomStackView1.addGestureRecognizer(tap)
            tap.selectedRandomStackView = indexPath
        case 1:
            menuItemDetailView.randomStackView2.pairingItemIconImageView.image = UIImage(named: randomItem.imageName)
            menuItemDetailView.randomStackView2.pairingItemTitleLabel.text = randomItem.name
            menuItemDetailView.randomStackView2.pairingItemPriceLabel.text = String(format: "$%.02f", randomItem.price)
            menuItemDetailView.randomStackView2.addGestureRecognizer(tap)
            tap.selectedRandomStackView = indexPath
        case 2:
            menuItemDetailView.randomStackView3.pairingItemIconImageView.image = UIImage(named: randomItem.imageName)
            menuItemDetailView.randomStackView3.pairingItemTitleLabel.text = randomItem.name
            menuItemDetailView.randomStackView3.pairingItemPriceLabel.text = String(format: "$%.02f", randomItem.price)
            menuItemDetailView.randomStackView3.addGestureRecognizer(tap)
            tap.selectedRandomStackView = indexPath
        default:
            print("Sorry! I was unable to assign random pairings.")
        }
    }
    
    @objc func randomItemTapped (recognizer: MyTapGesture) {
        switch recognizer.selectedRandomStackView {
        case 0:
            self.selectedRandomItem = self.randomElement1
        case 1:
            self.selectedRandomItem = self.randomElement2
        case 2:
            self.selectedRandomItem = self.randomElement3
        default:
            print("If you're seeing this, something went wrong...")
        }
        self.navigationController?.pushViewController(MenuItemViewController(selectedItem: self.selectedRandomItem), animated: true)
    }
    
    class MyTapGesture: UITapGestureRecognizer {
        var selectedRandomStackView = Int()
    }

}
