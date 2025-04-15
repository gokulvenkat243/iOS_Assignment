//
//  ViewController.swift
//  iOS_Assignment
//
//  Created by gokul v on 14/04/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var headerView: HomeHeaderView = {
        let view: HomeHeaderView = HomeHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 25
        return view
    }()
    
    private lazy var footerView: HomeFooterView = {
        let view: HomeFooterView = HomeFooterView(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 25
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        self.setupUI()
        self.setupConstraints()
        viewModel.fetchHomeData()
    }
    
    private func setupUI() {
        view.addSubviews(headerView, footerView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 260),
            
            footerView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 10),
            footerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            footerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            footerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
