//
//  Menu.swift
//  CafeApp
//
//  Created by Mayuko Inoue on 9/9/21.
//

import Foundation

protocol MenuItem {
    var imageName: String { get set }
    var name: String { get set }
    var description: String { get set }
    var price: Double { get set }
    var ingredients: String { get set }
    
    init(withImageName imageName: String, withName name: String, withDescription description: String, withPrice price: Double, withIngredients ingredients: String)
}

enum ProductType: Int, CaseIterable {
    case drinks
    case foods
    case merchAndOthers
}

struct Menu {
    var drinks = [
        Drink(withImageName: "drinks_coffee", withName: "Drip Coffee",
              withDescription: "Our daily house drip coffee", withPrice: 2.0, withIngredients: "coffee, water"),
        Drink(withImageName: "drinks_coldbrew", withName: "Cold Brew",
              withDescription: "Daily brewed cold brew", withPrice: 3.0, withIngredients: "coffee, water"),
        Drink(withImageName: "drinks_pourover", withName: "Pourover",
              withDescription: "A handmade cup of coffee using a V60", withPrice: 4.5, withIngredients: "coffee, water"),
        Drink(withImageName: "drinks_latte", withName: "Latte",
              withDescription: "Espresso with milk or milk alternatives", withPrice: 5.0, withIngredients: "coffee, water, milk"),
        Drink(withImageName: "drinks_icedlatte", withName: "Iced Latte",
              withDescription: "Iced espresso with milk or milk alternatives", withPrice: 5.0, withIngredients: "coffee, water, milk, ice"),
        Drink(withImageName: "drinks_espresso", withName: "Espresso",
              withDescription: "A hand-pulled shot of our house espresso", withPrice: 3.5, withIngredients: "coffee, water"),
        Drink(withImageName: "drinks_vietcoffee", withName: "Vietnamese Coffee",
              withDescription: "Intensely caffeinated cup using Cafe Du Monde", withPrice: 4.25, withIngredients: "coffee, water"),
        Drink(withImageName: "drinks_tea", withName: "Tea",
              withDescription: "Tazo tea, hot or iced", withPrice: 2.5, withIngredients: "tea leaves, water"),
        Drink(withImageName: "drinks_milk", withName: "Milk",
              withDescription: "A cup of a milk of your choice", withPrice: 2.0, withIngredients: "milk"),
    ]
    
    var foods = [
        Food(withImageName: "foods_croissant", withName: "Croissant",
             withDescription: "A crispy, buttery croissant", withPrice: 4.0, withIngredients: "flour, yeast, butter, sugar"),
        Food(withImageName: "foods_pie", withName: "Pie",
             withDescription: "Homebaked Apple Pie slice", withPrice: 4.5, withIngredients: "apple, butter, flour, cinammon"),
        Food(withImageName: "foods_donut", withName: "Donut",
             withDescription: "Our popular old fashion Donut", withPrice: 3.5, withIngredients: "flour, sugar, egg, butter"),
        Food(withImageName: "foods_cupcake", withName: "Cupcake",
             withDescription: "Moist cake with a layer of vanilla buttercream", withPrice: 4.0, withIngredients: "flour, egg, butter, sugar"),
        Food(withImageName: "foods_cookie", withName: "Cookie",
             withDescription: "One giant chocolate chip cookie with sea salt", withPrice: 4.0, withIngredients: "butter, egg, sugar, chocolate chips"),
        Food(withImageName: "foods_gelato", withName: "Gelato",
             withDescription: "A scoop of our housemade gelato", withPrice: 3.5, withIngredients: "cream, milk, sugar"),
        Food(withImageName: "foods_sandwich", withName: "Sandwich",
             withDescription: "Ham, cheese, lettuce, tomato on sourdough", withPrice: 5.50, withIngredients: "ham, cheese, lettuce, tomato"),
        Food(withImageName: "foods_chocolate", withName: "Chocolate",
             withDescription: "A bar of Ritter Sport", withPrice: 3.5, withIngredients: "dark chocolate, sugar"),
    ]
    var merchAndOthers: [MenuItem] = [
        Merch(withImageName: "merch_beans", withName: "Coffee Beans",
              withDescription: "In-house roasted beans, whole or ground", withPrice: 12.5, withIngredients: "fresh energy and roasted creativity"),
        Merch(withImageName: "merch_chemex", withName: "Chemex",
              withDescription: "To make pourovers at home", withPrice: 20.0, withIngredients: "fresh energy and roasted creativity"),
        Merch(withImageName: "merch_grinder", withName: "Coffee Grinder",
              withDescription: "Kalita hand grinder", withPrice: 15.5, withIngredients: "fresh energy and roasted creativity"),
        Merch(withImageName: "merch_filters", withName: "Coffee Filters",
              withDescription: "Chemex filters, packs of 100", withPrice: 6.5, withIngredients: "fresh energy and roasted creativity"),
        MiscItem(withImageName: "other_newspaper", withName: "Newspaper",
              withDescription: "Daily newspaper", withPrice: 3.5, withIngredients: "fresh energy and roasted creativity"),
    ]
    
    func sortDrinksByPrice() -> [Drink] {
        return drinks.sorted { $0.price < $1.price }
    }
    
    func sortFoodsByPrice() -> [Food] {
        return foods.sorted { $0.price < $1.price }
    }
    
    func sortMerchByPrice() -> [MenuItem] {
        return merchAndOthers.sorted { $0.price < $1.price }
    }
    
    func sortDrinksByName() -> [Drink] {
        return drinks.sorted { $0.name < $1.name }
    }
    
    func sortFoodsByName() -> [Food] {
        return foods.sorted { $0.name < $1.name }
    }
    
    func sortMerchByName() -> [MenuItem] {
        return merchAndOthers.sorted { $0.name < $1.name }
    }
    
}
