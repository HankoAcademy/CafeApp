//
//  MenuTableHeaderView.swift
//  CafeApp
//
//  Created by Mayuko Inoue on 9/9/21.
//
import UIKit

class MenuTableHeaderView: UITableViewHeaderFooterView {

// MARK: - Class Properties
    
    var headerName: String = "" {
        didSet {
            let attributedString = NSMutableAttributedString(string: headerName)
            attributedString.addAttribute(NSAttributedString.Key.kern, value: 14, range: NSRange(location: 0, length: attributedString.length))
            headerLabel.attributedText = attributedString
        }
    }
    
    var hideFilterAndSort: Bool = true {
        didSet {
            stackView.isHidden = hideFilterAndSort
        }
    }
    
// MARK: - UI Component Declarations
    
    private var headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var bottomLineView: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: "Navy")
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.isHidden = true
        return stackView
    }()
    
    private let emptyView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let filterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .thin)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("filter", for: .normal)
        button.addTarget(self, action: #selector(filterButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let sortButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .thin)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("sort", for: .normal)
        button.addTarget(self, action: #selector(sortButtonPressed), for: .touchUpInside)
        return button
    }()
    
// MARK: - Initializers
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupUI()
        activateConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupUI()
        activateConstraints()
    }
    
// MARK: - UI Setup Functions
    
    private func setupUI() {
        contentView.backgroundColor = UIColor(named: "Cream")
        contentView.addSubview(headerLabel)
        contentView.addSubview(bottomLineView)
        stackView.addArrangedSubview(emptyView)
        stackView.addArrangedSubview(filterButton)
        stackView.addArrangedSubview(sortButton)
        contentView.addSubview(stackView)
    }
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            emptyView.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 3/4),
            
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            stackView.bottomAnchor.constraint(equalTo: headerLabel.topAnchor, constant: -8),
            
            headerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            headerLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 8),
            headerLabel.bottomAnchor.constraint(equalTo: bottomLineView.topAnchor, constant: -12),

            bottomLineView.leadingAnchor.constraint(equalTo: headerLabel.leadingAnchor),
            bottomLineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bottomLineView.heightAnchor.constraint(equalToConstant: 1),
            bottomLineView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
        
// MARK: - Actions
    
    @objc func sortButtonPressed() {
        print("Sort button pressed")
    }
    
    @objc func filterButtonPressed() {
        print("Filter button pressed")
    }
}
