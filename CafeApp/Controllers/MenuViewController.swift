//
//  ViewController.swift
//  CafeApp
//
//  Created by Hannie Kim on 7/18/21.
//
import UIKit

enum SortType {
    case name, price
}
protocol Sortable: AnyObject {
    func sort()
}

protocol Filterable: AnyObject {
    func filter()
}

class MenuViewController: UIViewController {
    
    var menu: Menu
    
// MARK: - UI Component Declarations
    var menuHeaderView: MenuHeaderView = {
        let headerView = MenuHeaderView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    
    var menuTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor(named: "Cream")
        tableView.layer.cornerRadius = 20
        tableView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MenuItemTableViewCell.self, forCellReuseIdentifier: "DefaultItemCell")
        tableView.register(MenuTableHeaderView.self, forHeaderFooterViewReuseIdentifier: "MenuHeaderView")
        
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 100
        return tableView
    }()
    
// MARK: - Initializers
    init(withMenu menu: Menu) {
        self.menu = menu
        
        super.init(nibName: nil, bundle: nil)
        
        setupUI()
        activateConstraints()
    }
    
    required init?(coder: NSCoder) {
        self.menu = Menu() //default menu
        
        super.init(coder: coder)
        
        setupUI()
        activateConstraints()
    }
    
// MARK: - UI Setup Functions
    
     func setupUI() {
        view.backgroundColor = .white
        
        menuTableView.dataSource = self
        menuTableView.delegate = self

        view.addSubview(menuHeaderView)
        view.addSubview(menuTableView)
    }
    
     func activateConstraints() {
        NSLayoutConstraint.activate([
            menuHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            menuHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
            menuHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
            
            menuTableView.topAnchor.constraint(equalTo: menuHeaderView.bottomAnchor, constant: 24),
            menuTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menuTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
// MARK: - View Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hides the navigation bar
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Needed so the hiding of the navigation bar only affects this view controller
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return menu.drinks.count
        case 1:
            return menu.foods.count
        case 2:
            return menu.merchAndOthers.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultItemCell") as? MenuItemTableViewCell else {
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
            break
        }
        
        if let menuItem = menuItem {
            cell.imageName = menuItem.imageName
            cell.itemName = menuItem.name
            cell.itemDescription = menuItem.description
            cell.itemPrice = menuItem.price
        }
        
        return cell
    }
}

extension MenuViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MenuHeaderView") as? MenuTableHeaderView else {
            return nil
        }
        
        headerView.sortableDelegate = self
        headerView.filterableDelegate = self
        
        switch section {
        case 0:
            headerView.headerName = "Drinks"
            headerView.hideFilterAndSort = false
        case 1:
            headerView.headerName = "Food"
        case 2:
            headerView.headerName = "Merch • Other"
        default:
            headerView.headerName = "Other"
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0:
            navigationController?.pushViewController(MenuItemViewController(menuItemSelected: menu.drinks[indexPath.row]), animated: true)
        case 1:
            navigationController?.pushViewController(MenuItemViewController(menuItemSelected: menu.foods[indexPath.row]), animated: true)
        case 2:
            navigationController?.pushViewController(MenuItemViewController(menuItemSelected: menu.merchAndOthers[indexPath.row]), animated: true)
        default:
            return
        }
    }
}

extension MenuViewController: Sortable {
    func sort() {
        let alertController = UIAlertController(title: "", message: "Select Sort Type", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Name", style: .default, handler: { [weak self] _ in
            print("Sorting the menu by name")
            if let sortedMenu = self?.menu.sortMenu(bySortType: .name) {
                self?.menu = sortedMenu
                self?.menuTableView.reloadData()
            }
        }))
        alertController.addAction(UIAlertAction(title: "Price", style: .default, handler: { [weak self] _ in
            print("Sorting the menu by price")
            if let sortedMenu = self?.menu.sortMenu(bySortType: .price) {
                self?.menu = sortedMenu
                self?.menuTableView.reloadData()
            }
        }))
        present(alertController, animated: true, completion: nil)
    }
}

extension MenuViewController: Filterable {
    func filter() {
        let alertController = UIAlertController(title: "", message: "Select Filter Type", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Drinks", style: .default, handler: { _ in
            print("filter drinks")
        }))
        alertController.addAction(UIAlertAction(title: "Food", style: .default, handler: { _ in
            print("filter food")
        }))
        alertController.addAction(UIAlertAction(title: "Merch", style: .default, handler: { _ in
            print("filter merch")
        }))
        present(alertController, animated: true, completion: nil)
    }
}
