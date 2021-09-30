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
    
    init(withImageName imageName: String, withName name: String, withDescription description: String, withPrice price: Double)
}

struct Menu {
    var drinks = [
        Drink(withImageName: "drinks_coffee", withName: "Drip Coffee",
              withDescription: "Our daily house drip coffee", withPrice: 2.0),
        Drink(withImageName: "drinks_coldbrew", withName: "Cold Brew",
              withDescription: "Daily brewed cold brew", withPrice: 3.0),
        Drink(withImageName: "drinks_pourover", withName: "Pourover",
              withDescription: "A handmade cup of coffee using a V60", withPrice: 4.5),
        Drink(withImageName: "drinks_latte", withName: "Latte",
              withDescription: "Espresso with milk or milk alternatives", withPrice: 5.0),
        Drink(withImageName: "drinks_icedlatte", withName: "Iced Latte",
              withDescription: "Iced espresso with milk or milk alternatives", withPrice: 5.0),
        Drink(withImageName: "drinks_espresso", withName: "Espresso",
              withDescription: "A hand-pulled shot of our house espresso", withPrice: 3.5),
        Drink(withImageName: "drinks_vietcoffee", withName: "Vietnamese Coffee",
              withDescription: "Intensely caffeinated cup using Cafe Du Monde", withPrice: 4.25),
        Drink(withImageName: "drinks_tea", withName: "Tea",
              withDescription: "Tazo tea, hot or iced", withPrice: 2.5),
        Drink(withImageName: "drinks_milk", withName: "Milk",
              withDescription: "A cup of a milk of your choice", withPrice: 2.0)
    ]
    
    var foods = [
        Food(withImageName: "foods_croissant", withName: "Croissant",
             withDescription: "A crispy, buttery croissant", withPrice: 4.0),
        Food(withImageName: "foods_pie", withName: "Pie",
             withDescription: "Homebaked Apple Pie slice", withPrice: 4.5),
        Food(withImageName: "foods_donut", withName: "Donut",
             withDescription: "Our popular old fashion Donut", withPrice: 3.5),
        Food(withImageName: "foods_cupcake", withName: "Cupcake",
             withDescription: "Moist cake with a layer of vanilla buttercream", withPrice: 4.0),
        Food(withImageName: "foods_cookie", withName: "Cookie",
             withDescription: "One giant chocolate chip cookie with sea salt", withPrice: 4.0),
        Food(withImageName: "foods_gelato", withName: "Gelato",
             withDescription: "A scoop of our housemade gelato", withPrice: 3.5),
        Food(withImageName: "foods_sandwich", withName: "Sandwich",
             withDescription: "Ham, cheese, lettuce, tomato on sourdough", withPrice: 5.50),
        Food(withImageName: "foods_chocolate", withName: "Chocolate",
             withDescription: "A bar of Ritter Sport", withPrice: 3.5),
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
        MiscItem(withImageName: "other_newspaper", withName: "Newspaper",
              withDescription: "Daily newspaper", withPrice: 3.5),
    ]
    
    func sortSectionByPrice(section:Int)->[MenuItem]{
        switch section{
        case 0: return drinks.sorted{ $0.price < $1.price
        }
        case 1:return foods.sorted{ $0.price < $1.price
        }
        case 2:return merchAndOthers.sorted{ $0.price < $1.price
        }
        default:return drinks.sorted{ $0.price < $1.price
        }
            
        }
    }
    func sortSectionByName(section:Int)->[MenuItem]{
        switch section{
        case 0: return drinks.sorted{ $0.name < $1.name
            
        }
        case 1:return foods.sorted{ $0.name < $1.name
        }
        case 2:return merchAndOthers.sorted{ $0.name < $1.name
        }
        default:return drinks.sorted{ $0.name < $1.name
        }
            
        }
    }
    func getPairings(item:MenuItem)->[MenuItem]{
        var pairingList = [MenuItem]()
        if let anItem = item as? Drink{
            var foodList = self.foods
            if foodList != nil, foodList.count > 0{
                for i in 0...2{
                    let endIndex = foodList.count - 1
                    let randomIndex = Int.random(in:0...endIndex)
                    let paringItem = foodList[randomIndex]
                    pairingList.append(paringItem)
                    foodList.remove(at: randomIndex)
                }
            }
            print("food List \(pairingList.map{$0.name})")
            //get random 3 unique food items
            print("this is a drink")
        } else if let anItem = item as? Food{
            var drinkList = self.drinks
            if drinkList != nil, drinkList.count > 0{
                for i in 0...2{
                    let endIndex = drinkList.count - 1
                    let randomIndex = Int.random(in:0...endIndex)
                    let paringItem = drinkList[randomIndex]
                    pairingList.append(paringItem)
                    drinkList.remove(at: randomIndex)
                }
            }
            print("drink List \(pairingList.map{$0.name})")
            //get random 3 unique food items
            print("this is a drink")
        } else {
            //get random 2 unique drinks and 1 food
            var drinkList = self.drinks
            if drinkList != nil, drinkList.count > 0{
                for i in 0...1{
                    let endIndex = drinkList.count - 1
                    let randomIndex = Int.random(in:0...endIndex)
                    let paringItem = drinkList[randomIndex]
                    pairingList.append(paringItem)
                    drinkList.remove(at: randomIndex)
                }
            }
            var foodList = self.foods
            if foodList != nil, foodList.count > 1{
                let endIndex = foodList.count - 1
                let randomIndex = Int.random(in:0...endIndex)
                let paringItem = foodList[randomIndex]
                pairingList.append(paringItem)
            }
            print("Mixed List \(pairingList.map{$0.name})")
            print("this is other")
        }
      return pairingList
    }
    
}
