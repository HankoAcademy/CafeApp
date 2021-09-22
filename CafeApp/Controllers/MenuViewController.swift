//
//  MenuViewController.swift
//  CafeApp
//
//  Created by Hannie Kim on 9/12/21.
//

import UIKit

class MenuViewController: UIViewController {
    
    // You got this! Let us know if you have questions or want feedback about your code 🙂
    
    // MARK: - Properties
    
    private var contentView: ContentView!
    
    // MARK: - Initializers
    
    override func loadView() {
        contentView = ContentView()
        
        view = contentView
    }
}
