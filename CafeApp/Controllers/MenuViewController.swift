//
//  MenuViewController.swift
//  CafeApp
//
//  Created by Hannie Kim on 9/12/21.
//

import UIKit

class MenuViewController: UIViewController{
    
    // MARK: - UI Component Declarations
    
    var sections:[[MenuItem]]?
    
    var menu = Menu(){
        didSet{
            sections?[0] = menu.drinks
            sections?[1] = menu.foods
            sections?[2] = menu.merchAndOthers
        }
    }
    
    var originalMenu:Menu!
    
    let bannerView:BannerView = {
        let view = BannerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let tableView:UITableView = {
        let tv = UITableView()
        tv.backgroundColor = UIColor(named:"cream")
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.layer.cornerRadius = 30
        tv.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tv.separatorStyle = .singleLine
        tv.separatorColor = .gray
        tv.register(MenuTableHeaderView.self, forHeaderFooterViewReuseIdentifier: "MenuHeaderView")
        tv.register(ItemCell.self, forCellReuseIdentifier: "ItemCell")
        tv.allowsSelection = true
        return tv
    }()
    
    // MARK: - Initializers
    init(){
        super.init(nibName:nil, bundle:nil)
        setUpUI()
        originalMenu = menu
    }
    required init?(coder:NSCoder){
        super.init(coder:coder)
        setUpUI()
        originalMenu = menu
    }
    // MARK: - UI Setup Functions
    
    private func setUpUI(){
        sections = [menu.drinks,menu.foods,menu.merchAndOthers]
        tableView.dataSource = self
        tableView.delegate = self
        
        view.backgroundColor = .white
        view.addSubview(bannerView)
        NSLayoutConstraint.activate([
            bannerView.topAnchor.constraint(equalTo: self.view.topAnchor),
            bannerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            bannerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            bannerView.heightAnchor.constraint(equalToConstant: 190)
        ])
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: bannerView.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    // MARK: - View LifeCycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    // MARK: - ButtonActions
    public func sortButtonPressed() {
        
        let alertController = UIAlertController(title: nil, message: "Sort by:", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Price", style: .default){ _ in
            self.menu.drinks = self.menu.sortSectionByPrice(section: 0) as! [Drink]
            self.menu.foods = self.menu.sortSectionByPrice(section: 1) as! [Food]
            self.menu.merchAndOthers = self.menu.sortSectionByPrice(section: 2)
            for item in self.menu.drinks{
                print("sorted -> \(item.name)  \(item.price)")
            }
            self.tableView.reloadData()
        })
        alertController.addAction(UIAlertAction(title: "Name", style: .default){ _ in
            self.menu.drinks = self.menu.sortSectionByName(section: 0) as! [Drink]
            self.menu.foods = self.menu.sortSectionByName(section: 1) as! [Food]
            self.menu.merchAndOthers = self.menu.sortSectionByName(section: 2)
            for item in self.menu.drinks{
                print("sorted by name -> \(item.name) ")
            }
            self.tableView.reloadData()
        })
        present(alertController, animated: true, completion: nil)
        
        print("filter Button pressed")
        menu.drinks = menu.sortSectionByPrice(section: 0) as! [Drink]
        menu.foods = menu.sortSectionByPrice(section: 1) as! [Food]
        menu.merchAndOthers = menu.sortSectionByPrice(section: 2)
        for item in menu.drinks{
            print("sorted -> \(item.name)  \(item.price)")
        }
        self.tableView.reloadData()
    }
    
    public func filterButtonPressed() {
        let alertController = UIAlertController(title: nil, message: "filter by:", preferredStyle: .actionSheet)
        
        menu = originalMenu
        
        alertController.addAction(UIAlertAction(title: "Drink", style: .default){ _ in
            self.menu.foods.removeAll()
            self.menu.merchAndOthers.removeAll()
            self.tableView.reloadData()
        })
        alertController.addAction(UIAlertAction(title: "Foods", style: .default){ _ in
            self.menu.drinks.removeAll()
            self.menu.merchAndOthers.removeAll()
            self.tableView.reloadData()
        })
        alertController.addAction(UIAlertAction(title: "Merch and Others", style: .default){ _ in
            self.menu.foods.removeAll()
            self.menu.drinks.removeAll()
            self.tableView.reloadData()
        })
        alertController.addAction(UIAlertAction(title: "All", style: .default){ _ in
            self.menu = self.originalMenu
            self.tableView.reloadData()
        })
        present(alertController, animated: true, completion: nil)
    }
}

extension MenuViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = self.sections?[section]
        return section?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") as! ItemCell
        let section = indexPath.section
        let item = sections?[section][indexPath.row]
        
        if let item = item{
            if let image = UIImage(named:item.imageName){
                cell.productImage.image = image
            }
            cell.priceLabel.text = String(format: "$%.2f", item.price)
            cell.descriptionLabel.text = item.description
            cell.nameLabel.text = item.name
        }
        return cell
    }
}

extension MenuViewController:UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        sections?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if sections?[section].count == 0{
            return 0
        }
        return 85
        //If I put the headerView items in stackView, I think it won't shrink to
        //hide the headerLabel as I make default size less than 85
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if sections?[section].count == 0{
            return nil
        }
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MenuHeaderView") as? MenuTableHeaderView
        else {
            return nil
        }
        //pass in headerView's function
        
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
        if sections?.count == 1{
            headerView.hideFilterAndSort = false
        }
        
        headerView.sortButtonAction = sortButtonPressed
        headerView.filterButtonAction = filterButtonPressed
        
        return headerView
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        menu = originalMenu
        let item = sections?[indexPath.section][indexPath.row]
        print("passing item -> \(item?.name)")
        let destinationVC = MenuItemViewController(menuItem:item!, menu:menu)
        destinationVC.menu = menu
        navigationController?.pushViewController(destinationVC, animated: false)
        print("select pressed")
    }
}
