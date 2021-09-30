//
//  menuItemButton.swift
//  CafeApp
//
//  Created by Victoria Park on 9/28/21.
//

import UIKit

class MenuItemButton: UIButton{
    
    var delegate:ShowNewItemDelegate?
    var buttonAction:((_ menuItem:MenuItem?) -> Void)?
    var menuItem:MenuItem?
    
    init(menuItem:MenuItem?, delegate:ShowNewItemDelegate?){
        self.menuItem = menuItem
        self.delegate = delegate
        super.init(frame: .zero)
        setUpUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    private func setUpUI(){
        backgroundColor = UIColor(named:"cream")
        addTarget(self, action: #selector(buttonPressed), for : .touchUpInside)
        titleLabel?.numberOfLines = 0
        titleLabel?.lineBreakMode = .byWordWrapping
        titleLabel?.textAlignment = .center
        layer.cornerRadius = 20
        self.imageView!.contentMode = .scaleAspectFill
        if let menuItem = menuItem, let anImage = UIImage(named:menuItem.imageName){
            self.setImage(anImage, for: .normal)
            let priceString = String(format:"%.2f", menuItem.price)
            self.setTitle("\(menuItem.name)\n$\(priceString)", for: .normal)
            self.setTitleColor(.black, for: .normal)
            self.titleLabel?.adjustsFontSizeToFitWidth = true
            self.alignTextUnderImage()
    }
   }
    // MARK: - Actions
    @objc func buttonPressed(){
        if let menuItem = menuItem{
            delegate?.pairingItemPressed(menuItem: menuItem)
        }
    }
}
    
    public extension UIButton
      {

        func alignTextUnderImage(spacing: CGFloat = 2.0)
        {
            if let image = self.imageView?.image
            {
                let imageSize: CGSize = image.size
                
                self.titleEdgeInsets = UIEdgeInsets(top: 50, left: -imageSize.width, bottom: 0.0, right: 0.0)
                let labelString = NSString(string: self.titleLabel!.text!)
                let titleSize = labelString.size(withAttributes: [NSAttributedString.Key.font: self.titleLabel!.font])
                self.imageEdgeInsets = UIEdgeInsets(top: -15, left: 0.0, bottom:10, right: -titleSize.width)
            }
        }
    }

