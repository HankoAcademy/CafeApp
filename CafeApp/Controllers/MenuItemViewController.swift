//
//  MenuIItemViewController.swift
//  CafeApp
//
//  Created by Victoria Park on 9/27/21.
//

import UIKit

protocol ShowNewItemDelegate:AnyObject{
    func pairingItemPressed(menuItem:MenuItem)
}

class MenuItemViewController: UIViewController, ShowNewItemDelegate {
    
    var menuItem:MenuItem
    var menu:Menu  // whole menu
    var pairingList = [MenuItem]()
    
    let mainStack:UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        return stack
    }()
    
    //MARK: Top View
    
    lazy var topView:MenuItemTopView = {
        let view = MenuItemTopView(menuItem: menuItem)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    //MARK: BOTTOM VIEW
    let bottomStackView:UIStackView = {
        //white view with uiImage and price label on top
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.alignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let ingredientsBackingView:IngredientsView = {
        let view = IngredientsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var pairingBackingView:PairingsView = {
        let view = PairingsView(pairingList: pairingList, delegate: self)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    
    init(menuItem:MenuItem, menu:Menu){
        self.menuItem = menuItem
        self.menu = menu
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder:NSCoder){
        fatalError("init(coer:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = menuItem.name
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = UIColor(named:"cream")
        
        pairingList = menu.getPairings(item: menuItem)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addViews()
        setUpUI()
    }
    
    func addViews(){
        view.addSubview(mainStack)
        mainStack.addArrangedSubview(topView)
        mainStack.addArrangedSubview(bottomStackView)
        bottomStackView.addArrangedSubview(ingredientsBackingView)
        bottomStackView.addArrangedSubview(pairingBackingView)
        
    }
    
    func setUpTopView(){
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    func setUpBottomView(){
        //ingredientsView pairingView
        
        NSLayoutConstraint.activate([
            ingredientsBackingView.widthAnchor.constraint(equalTo: bottomStackView.widthAnchor),
            ingredientsBackingView.heightAnchor.constraint(equalTo: bottomStackView.heightAnchor, multiplier: 0.4)
        ])
        
        view.layoutIfNeeded()
        NSLayoutConstraint.activate([
            pairingBackingView.widthAnchor.constraint(equalTo: bottomStackView.widthAnchor),
            pairingBackingView.heightAnchor.constraint(equalTo: bottomStackView.heightAnchor, multiplier: 0.6)
        ])
        
    }
    func setUpUI(){
        setUpTopView()
        setUpBottomView()
    }
    
    // MARK: - ShowNewItemDelegate
    func pairingItemPressed(menuItem:MenuItem){
        
        let newMenuItemVC = MenuItemViewController(menuItem:menuItem, menu:menu)
        navigationController?.pushViewController(newMenuItemVC, animated: false)
    }
    
}

