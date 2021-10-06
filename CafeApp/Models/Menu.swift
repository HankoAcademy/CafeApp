//
//  Menu.swift
//  CafeApp
//
//  Created by Mayuko Inoue on 9/9/21.
//

import Foundation

protocol MenuItem {
    var imageName: String { get }
    var name: String { get }
    var description: String { get }
    var price: Double { get }
    var type: ProductType { get }
    var ingredients: [String]? { get }
    
    init(withImageName imageName: String, withName name: String, withDescription description: String, withPrice price: Double, withIngredients ingredients: [String]?)
}

enum ProductType: Int, CaseIterable {
    case drinks, foods, merchAndOthers, misc
}

struct Menu {
    
    enum SortType {
        case price, name
    }
    
    var drinks = [
        Drink(withImageName: "drinks_coffee", withName: "Drip Coffee",
              withDescription: "Our daily house drip coffee", withPrice: 2.0, withIngredients: ["coffee", "water"]),
        Drink(withImageName: "drinks_coldbrew", withName: "Cold Brew",
              withDescription: "Daily brewed cold brew", withPrice: 3.0, withIngredients: ["coffee", "water"]),
        Drink(withImageName: "drinks_pourover", withName: "Pourover",
              withDescription: "A handmade cup of coffee using a V60", withPrice: 4.5, withIngredients: ["coffee", "water"]),
        Drink(withImageName: "drinks_latte", withName: "Latte",
              withDescription: "Espresso with milk or milk alternatives", withPrice: 5.0, withIngredients: ["milk", "espresso"]),
        Drink(withImageName: "drinks_icedlatte", withName: "Iced Latte",
              withDescription: "Iced espresso with milk or milk alternatives", withPrice: 5.0, withIngredients: ["milk", "ice", "espresso"]),
        Drink(withImageName: "drinks_espresso", withName: "Espresso",
              withDescription: "A hand-pulled shot of our house espresso", withPrice: 3.5, withIngredients: ["shot of espresso"]),
        Drink(withImageName: "drinks_vietcoffee", withName: "Vietnamese Coffee",
              withDescription: "Intensely caffeinated cup using Cafe Du Monde", withPrice: 4.25, withIngredients: ["coffee", "water"]),
        Drink(withImageName: "drinks_tea", withName: "Tea",
              withDescription: "Tazo tea, hot or iced", withPrice: 2.5, withIngredients: ["tea", "water"]),
        Drink(withImageName: "drinks_milk", withName: "Milk",
              withDescription: "A cup of a milk of your choice", withPrice: 2.0, withIngredients: ["milk"])
    ]
    
    var foods = [
        Food(withImageName: "foods_croissant", withName: "Croissant",
             withDescription: "A crispy, buttery croissant", withPrice: 4.0, withIngredients: ["flour", "water"]),
        Food(withImageName: "foods_pie", withName: "Pie",
             withDescription: "Homebaked Apple Pie slice", withPrice: 4.5, withIngredients: ["butter", "flour", "crust", "cream"]),
        Food(withImageName: "foods_donut", withName: "Donut",
             withDescription: "Our popular old fashion Donut", withPrice: 3.5, withIngredients: ["flour"]),
        Food(withImageName: "foods_cupcake", withName: "Cupcake",
             withDescription: "Moist cake with a layer of vanilla buttercream", withPrice: 4.0, withIngredients: ["flour", "milk"]),
        Food(withImageName: "foods_cookie", withName: "Cookie",
             withDescription: "One giant chocolate chip cookie with sea salt", withPrice: 4.0, withIngredients: ["cookie dough"]),
        Food(withImageName: "foods_gelato", withName: "Gelato",
             withDescription: "A scoop of our housemade gelato", withPrice: 3.5, withIngredients: ["whole milk"]),
        Food(withImageName: "foods_sandwich", withName: "Sandwich",
             withDescription: "Ham, cheese, lettuce, tomato on sourdough", withPrice: 5.50, withIngredients: ["whole wheat bread", "ham", "cheese"]),
        Food(withImageName: "foods_chocolate", withName: "Chocolate",
             withDescription: "A bar of Ritter Sport", withPrice: 3.5, withIngredients: ["chocolate"]),
    ]
    
    var merchAndOthers: [MenuItem] = [
        Merch(withImageName: "merch_beans", withName: "Coffee Beans",
              withDescription: "In-house roasted beans, whole or ground", withPrice: 12.5),
        Merch(withImageName: "merch_chemex", withName: "Chemex",
              withDescription: "To make pourovers at home", withPrice: 20.0),
        Merch(withImageName: "merch_grinder", withName: "Coffee Grinder",
              withDescription: "Kalita hand grinder", withPrice: 15.5),
        Merch(withImageName: "merch_filters", withName: "Coffee Filters",
              withDescription: "Chemex filters, packs of 100", withPrice: 6.5),
    ]
    
    var misc: [MenuItem] = [
        
        MiscItem(withImageName: "other_newspaper", withName: "Newspaper",
              withDescription: "Daily newspaper", withPrice: 3.5),
    ]

    
    func sortMenu(bySortType sortType: SortType) -> Menu {
        switch sortType {
        case .name:
            let sortedDrinks = drinks.sorted { $0.name < $1.name }
            let sortedFoods = foods.sorted { $0.name < $1.name }
            let sortedMerch = merchAndOthers.sorted { $0.name < $1.name }
            
            var menu = Menu()
            menu.drinks = sortedDrinks
            menu.foods = sortedFoods
            menu.merchAndOthers = sortedMerch
            return menu
        case .price:
            let sortedDrinks = drinks.sorted { $0.price < $1.price }
            let sortedFoods = foods.sorted { $0.price < $1.price}
            let sortedMerch = merchAndOthers.sorted { $0.price < $1.price }
            
            var menu = Menu()
            menu.drinks = sortedDrinks
            menu.foods = sortedFoods
            menu.merchAndOthers = sortedMerch
            return menu
        }
    }
    
    func generatePairings(forProductType productType: ProductType) -> [MenuItem] {
        switch productType {
        case .drinks:
            var foodToShuffle = foods
            foodToShuffle.shuffle()
            return [foodToShuffle[0], foodToShuffle[1], foodToShuffle[2]]
        case .foods:
            var drinksToShuffle = drinks
            drinksToShuffle.shuffle()
            return [drinksToShuffle[0], drinksToShuffle[1], drinksToShuffle[2]]
        case .merchAndOthers, .misc:
            var foodToShuffle = foods
            foodToShuffle.shuffle()
            
            var drinksToShuffle = drinks
            drinksToShuffle.shuffle()
            
            return [drinksToShuffle[0], drinksToShuffle[1], foodToShuffle[0]]
        }
    }
    
    
}
