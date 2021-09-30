//
//  mainView.swift
//  CafeApp
//
//  Created by Victoria Park on 9/16/21.
//

import UIKit

class MainView: UIView {
    
    weak var dataSource:UITableViewDataSource?
    weak var tvDelegate:UITableViewDelegate?
    
    
    // MARK: - UIComponent declarations
    // using closure properties
    
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
    
    
    //MARK: Initializers
    init(dataSource:UITableViewDataSource, tvDelegate:UITableViewDelegate){
        super.init(frame:.zero)
        tableView.dataSource = dataSource
        tableView.delegate = tvDelegate
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    private func setUpUI(){
        self.backgroundColor = .white
        self.addSubview(bannerView)
        NSLayoutConstraint.activate([
            bannerView.topAnchor.constraint(equalTo: self.topAnchor),
            bannerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bannerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bannerView.heightAnchor.constraint(equalToConstant: 190)
        ])
        self.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: bannerView.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
    }
}

