//
//  HomeHeaderView.swift
//  iOS_Assignment
//
//  Created by gokul v on 14/04/25.
//

import Foundation
import UIKit

class HomeHeaderView: UIView {
    
    private let leftButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.colorWithHexString(hexString: "#CCDA46")
        button.layer.cornerRadius = 22
        button.clipsToBounds = true
        let icon = UIImage(named: "DiscountImage")
        button.imageEdgeInsets = UIEdgeInsets(top: 32, left: 32, bottom: 32, right: 32)
        button.setImage(icon, for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Delivery address"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        label.textAlignment = .center
        return label
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.text = "92 High Street, London"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private let bellButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.setImage(UIImage(systemName: "bell"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar: UISearchBar = UISearchBar(frame: .zero)
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        searchBar.layer.cornerRadius = 10
        searchBar.layer.masksToBounds = true
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.backgroundColor = .systemGray6
        searchBar.searchTextField.backgroundColor = .systemGray6
        searchBar.barTintColor = .systemGray6
        searchBar.placeholder = "Search the entire shop"
        return searchBar
    }()
    
    
    private let offerBanner: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.85, green: 1.0, blue: 0.95, alpha: 1.0)
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        return view
    }()
    
    private let offerLabel1: UILabel = {
        let label = UILabel()
        label.text = "Delivery is"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private let offerHighlight: UILabel = {
        let label = UILabel()
        label.text = "50%"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.backgroundColor = .white
        label.textColor = .black
        label.textAlignment = .center
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    private let offerLabel2: UILabel = {
        let label = UILabel()
        label.text = "cheaper"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        backgroundColor = .white
        
        let titleStack = UIStackView(arrangedSubviews: [titleLabel, addressLabel])
        titleStack.axis = .vertical
        titleStack.alignment = .center
        titleStack.spacing = 2
        
        let navBar = UIView()
        navBar.addSubview(leftButton)
        navBar.addSubview(titleStack)
        navBar.addSubview(bellButton)
        
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        titleStack.translatesAutoresizingMaskIntoConstraints = false
        bellButton.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(navBar)
        navBar.translatesAutoresizingMaskIntoConstraints = false
        addSubview(searchBar)
        addSubview(offerBanner)
        offerBanner.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            navBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            navBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            navBar.heightAnchor.constraint(equalToConstant: 60),
            
            leftButton.leadingAnchor.constraint(equalTo: navBar.leadingAnchor),
            leftButton.centerYAnchor.constraint(equalTo: navBar.centerYAnchor),
            leftButton.widthAnchor.constraint(equalToConstant: 44),
            leftButton.heightAnchor.constraint(equalToConstant: 44),
            
            bellButton.trailingAnchor.constraint(equalTo: navBar.trailingAnchor),
            bellButton.centerYAnchor.constraint(equalTo: navBar.centerYAnchor),
            bellButton.widthAnchor.constraint(equalToConstant: 40),
            bellButton.heightAnchor.constraint(equalToConstant: 40),
            
            titleStack.centerXAnchor.constraint(equalTo: navBar.centerXAnchor),
            titleStack.centerYAnchor.constraint(equalTo: navBar.centerYAnchor),
            
            searchBar.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 12),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            searchBar.heightAnchor.constraint(equalToConstant: 50),
            
            offerBanner.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 12),
            offerBanner.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            offerBanner.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            offerBanner.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        let offerStack = UIStackView(arrangedSubviews: [offerLabel1, offerHighlight, offerLabel2])
        offerStack.axis = .horizontal
        offerStack.spacing = 8
        offerStack.alignment = .center
        offerBanner.addSubview(offerStack)
        offerStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            offerStack.centerYAnchor.constraint(equalTo: offerBanner.centerYAnchor),
            offerStack.leadingAnchor.constraint(equalTo: offerBanner.leadingAnchor, constant: 16)
        ])
        
        offerHighlight.setContentHuggingPriority(.required, for: .horizontal)
        offerHighlight.setContentCompressionResistancePriority(.required, for: .horizontal)
        offerHighlight.widthAnchor.constraint(greaterThanOrEqualToConstant: 40).isActive = true
        offerHighlight.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
}
